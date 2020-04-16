//
//  WeekDayView.swift
//  CalenderHeatmapDemo
//
//  Created by Dongjie Zhang on 2/27/20.
//  Copyright © 2020 Zachary. All rights reserved.
//

import UIKit

class WeekDayView: UIView {
    
    init(config: CalendarHeatmapConfig) {
        super.init(frame: .zero)
        backgroundColor = config.backgroundColor
        
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = config.interitemSpacing
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: config.monthHeight),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: config.itemSide * 7 + config.interitemSpacing * 6),
        ])
        
        var weekDayStrings = config.weekDayStrings
        // modify week day strong order based on calendar standard
        if config.weekDayStandard == .International {
            weekDayStrings.append(weekDayStrings.remove(at: 0))
        }
        
        for index in 0...6 {
            let label = UILabel()
            label.text = weekDayStrings[index]
            label.textColor = config.weekDayColor
            label.font = config.weekDayFont
            label.backgroundColor = config.backgroundColor
            label.translatesAutoresizingMaskIntoConstraints = false
            label.heightAnchor.constraint(equalToConstant: config.itemSide).isActive = true
            stackView.addArrangedSubview(label)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("no storyboard implementation, should not enter here")
    }
}
