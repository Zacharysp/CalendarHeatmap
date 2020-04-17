//
//  CalendarHeatmapData.swift
//  CalendarHeatmap
//
//  Created by Dongjie Zhang on 2/29/20.
//  Copyright © 2020 Zachary. All rights reserved.
//

import UIKit

struct CalendarHeatmapData {
    
    // cache for building calendar view
    private var days = [Date?]()
    
    // calculate calendar date.
    private let startDate: Date
    private let totalDays: Int
    private var currentYear: Int
    private var currentMonth: Int
    private var currentDay: Int
    
    // calculate header width related.
    private(set) var headerData = [(month: Int, width: CGFloat)]()
    private let config: CalendarHeatmapConfig
    // count column for each section, and count item in each column.
    // these two variables are used for calculate the width of each month header.
    private var columnCountInSection: Int = 0
    private var itemCountInColumn: Int = 0
    
    // calculate how many days left in this section which belong to next month.
    // when the reminder = 0, should move to next month section
    private var remindDaysInSection: Int = 0
    
    var daysCount: Int {
        return days.count
    }
    
    init(config: CalendarHeatmapConfig, startDate: Date, endDate: Date) {
        self.config = config
        
        // initial calculating variables.
        self.startDate = startDate
        self.totalDays = Date.daysBetween(start: startDate, end: endDate)
        self.currentYear = Calendar.current.component(.year, from: startDate)
        self.currentMonth = Calendar.current.component(.month, from: startDate)
        self.currentDay = Calendar.current.component(.day, from: startDate)
        
        // initial item count based on the weekday of the first date
        itemCountInColumn = Calendar.current.component(.weekday, from: startDate)
        
        setupCalendar()
    }
    
    func itemAt(indexPath: IndexPath) -> Date? {
        return days[indexPath.item]
    }
    
    private mutating func setupCalendar() {
        // cache for date of current month.
        let leadingEmptyDays = buildLeadingEmptyDays(date: startDate)
        days.append(contentsOf: leadingEmptyDays)
        var currentMonthCount = leadingEmptyDays.count
        // loop all days.
        for _ in 0...totalDays {
            // append current date to month section
            days.append(Date.dateOf(currentYear, currentMonth, currentDay))
            currentMonthCount += 1
            remindDaysInSection -= 1
            addOneItemCount(itemCount: &itemCountInColumn, columnCount: &columnCountInSection)
            if let thisMonth = moveToNextDay(year: &currentYear, month: &currentMonth, day: &currentDay) {
                // add previous month header
                headerData.append((thisMonth, calculateHeaderWidth(itemCountInColumn, columnCountInSection)))
                // reset column count
                columnCountInSection = itemCountInColumn == 1 ? 1 : 0
                // check if current row is filled up
                // the new month will start only when the column is filled up by the dates belong to the same month.
                // and then, at the end of each month section, it is possible to fill up days from the next month.
                remindDaysInSection = roundUp(days: currentMonthCount)
            }
            
            if remindDaysInSection == 0 {
                // the current month section is filled up, should start a new month section.
                // append the last month section and init a new month section
                currentMonthCount = 0
            }
        }
        guard currentMonthCount > 0 else { return }
        // use max width for the last momth header
        headerData.append((currentMonth, (config.itemSide + config.lineSpacing) * 5))
    }
    
    // MARK: setup header related functions
    private func calculateHeaderWidth(_ itemCount: Int, _ columnCount: Int) -> CGFloat {
        // based on the current item position.
        // if the current item is the first on in column, it belongs to the next month
        // otherwirs, it belongs to this month
        let sectionColumnCount = itemCount == 1 ? (columnCount - 1) : columnCount
        return CGFloat(sectionColumnCount) * (config.itemSide + config.lineSpacing)
    }
    
    private func addOneItemCount(itemCount: inout Int, columnCount: inout Int) {
        itemCount += 1
        if itemCount > 7 {
            // reset the item count for each column.
            itemCount = 1
            columnCount += 1
        }
    }
    
    // MARK: month related functions
    // do not display collection cell before the start date
    private mutating func buildLeadingEmptyDays(date: Date) -> [Date?] {
        // fill the leading empty day with nil date.
        // in calendar, if the item date is nil, fill the item with clear background color
        
        var weekDay = Calendar.current.component(.weekday, from: date) - (config.weekDayStandard == .International ? 1 : 0)
        if weekDay == 0 {
            // set sunday as 7 in internation standard
            weekDay = 7
        }
        // add count of the items in column
        itemCountInColumn = weekDay
        columnCountInSection += 1
        return (0 ..< weekDay - 1).map { _ in return nil }
    }
    
    // push forward one day, based on days in this month, updating the current year, month, day/
    // return this month if the next day belongs to next month
    private func moveToNextDay(year: inout Int, month: inout Int, day: inout Int) -> Int? {
        let totalDaysInMonth = findTotalDaysInMonth(year, month)
        day += 1
        if day > totalDaysInMonth {
            let thisMonth = month
            // forward to next month.
            day = 1
            month += 1
            if month > 12 {
                // forward to next year
                month = 1
                year += 1
            }
            return thisMonth
        } else {
            return nil
        }
    }
    
    // MARK: utils
    // return the count of days in this month, return 0 days if error
    private func findTotalDaysInMonth(_ year: Int, _ month: Int) -> Int {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        guard let date = Calendar.current.date(from: dateComponents) else { return 0 }
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    // round up to nearest multiple of 7
    private func roundUp(days: Int) -> Int {
        let reminder = days % 7
        return reminder == 0 ? reminder : (7 - reminder)
    }
}
