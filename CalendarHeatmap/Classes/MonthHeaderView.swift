//
//  MonthHeaderView.swift
//  CalenderHeatmapDemo
//
//  Created by Dongjie Zhang on 2/27/20.
//  Copyright © 2020 Zachary. All rights reserved.
//

import UIKit

class MonthHeaderView: UIStackView {
    
    private let config: CalendarHeatmapConfig
    
    init(config: CalendarHeatmapConfig) {
        self.config = config
        super.init(frame: .zero)
        
        alignment = .center
        axis = .horizontal
        distribution = .fillProportionally
        spacing = 0
    }
    
    func build(headers: [(month: Int, width: CGFloat)]) {
        DispatchQueue.main.async {
            self.removeAllArrangedSubviews()
            for header in headers {
                let monthText = self.config.monthStrings[header.month - 1]
                self.append(text: monthText, width: header.width)
            }
        }
    }
    
    private func append(text: String, width: CGFloat) {
        let label = UILabel()
        label.font = config.monthFont
        label.text = text
        label.textColor = config.monthColor
        label.backgroundColor = config.backgroundColor
        label.widthAnchor.constraint(equalToConstant: width).isActive = true
        addArrangedSubview(label)
    }
    
    required init(coder: NSCoder) {
        fatalError("no storyboard implementation, should not enter here")
    }
}
