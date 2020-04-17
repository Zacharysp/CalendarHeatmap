//
//  ViewController.swift
//  CalendarHeatmap
//
//  Created by Zacharysp on 03/02/2020.
//  Copyright (c) 2020 Zacharysp. All rights reserved.
//

import UIKit
import CalendarHeatmap

class ViewController: UIViewController {
    
    lazy var data: [String: UIColor] = {
        guard let data = readHeatmap() else { return [:] }
        return data.mapValues { (colorIndex) -> UIColor in
            switch colorIndex {
            case 0:
                return UIColor(named: "color1")!
            case 1:
                return UIColor(named: "color2")!
            case 2:
                return UIColor(named: "color3")!
            case 3:
                return UIColor(named: "color4")!
            default:
                return UIColor(named: "color5")!
            }
        }
    }()
    
    lazy var calendarHeatMap: CalendarHeatmap = {
        var config = CalendarHeatmapConfig()
        config.backgroundColor = UIColor(named: "background")!
        // config item
        config.selectedItemBorderColor = .white
        config.allowItemSelection = true
        // config month header
        config.monthHeight = 30
        config.monthStrings = DateFormatter().shortMonthSymbols
        config.monthFont = UIFont.systemFont(ofSize: 18)
        config.monthColor = UIColor(named: "text")!
        // config weekday label on left
        config.weekDayFont = UIFont.systemFont(ofSize: 12)
        config.weekDayWidth = 30
        config.weekDayColor = UIColor(named: "text")!
        
        let calendar = CalendarHeatmap(config: config, startDate: Date(2019, 5, 1), endDate: Date(2020, 3, 23))
        calendar.delegate = self
        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "background")
        
        view.addSubview(calendarHeatMap)
        calendarHeatMap.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calendarHeatMap.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 6),
            calendarHeatMap.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 6),
            calendarHeatMap.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    private func readHeatmap() -> [String: Int]? {
        guard let url = Bundle.main.url(forResource: "heatmap", withExtension: "plist") else { return nil }
        return NSDictionary(contentsOf: url) as? [String: Int]
    }
    
}

extension ViewController: CalendarHeatmapDelegate {
    func didSelectedAt(dateComponents: DateComponents) {
        guard let year = dateComponents.year,
            let month = dateComponents.month,
            let day = dateComponents.day else { return }
        // do something here
        print(year, month, day)
    }
    
    func colorFor(dateComponents: DateComponents) -> UIColor {
        guard let year = dateComponents.year,
            let month = dateComponents.month,
            let day = dateComponents.day else { return .clear}
        let dateString = "\(year).\(month).\(day)"
        return data[dateString] ?? UIColor(named: "color6")!
    }
    
    func finishLoadCalendar() {
        calendarHeatMap.scrollTo(date: Date(2020, 3, 23), at: .right, animated: false)
    }
}

extension Date {
    init(_ year:Int, _ month: Int, _ day: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        self.init(timeInterval:0, since: Calendar.current.date(from: dateComponents)!)
    }
}
