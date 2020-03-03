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
    
    func append(text: String, width: CGFloat) {
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
