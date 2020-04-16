//
//  CalendarHeatmapConfig.swift
//  CalenderHeatmapDemo
//
//  Created by Dongjie Zhang on 2/27/20.
//  Copyright © 2020 Zachary. All rights reserved.
//

import UIKit

public enum WeekDayStandard {
    case International // starts monday
    case USandCanada // starts sunday
}

public struct CalendarHeatmapConfig {
    public var backgroundColor: UIColor = .white
    public var contentRightInset: CGFloat = 60
    
    // calendar day item
    public var itemSide: CGFloat = 20
    public var itemCornerRadius: CGFloat = 4
    public var allowItemSelection: Bool = false
    public var selectedItemBorderColor: UIColor = .black
    public var selectedItemBorderLineWidth: CGFloat = 2
    public var interitemSpacing: CGFloat = 4
    public var lineSpacing: CGFloat = 4
    
    // calendar weekday
    public var weekDayColor: UIColor = .black
    public var weekDayStrings: [String] = DateFormatter().shortWeekdaySymbols.map{ $0.capitalized }
    public var weekDayFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .medium)
    public var weekDayWidth: CGFloat = 30
    public var weekDayStandard = WeekDayStandard.USandCanada
    
    // calendar month header
    public var monthColor: UIColor = .black
    public var monthStrings: [String] = DateFormatter().monthSymbols
    public var monthFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .medium)
    public var monthHeight: CGFloat = 20
    
    public init(){}
}
