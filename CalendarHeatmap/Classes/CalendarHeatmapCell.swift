//
//  CalendarHeatmapCell.swift
//  fill-it-up
//
//  Created by Dongjie Zhang on 1/31/20.
//  Copyright © 2020 Zachary. All rights reserved.
//

import UIKit

open class CalendarHeatmapCell: UICollectionViewCell {
    
    open var config: CalendarHeatmapConfig! {
        didSet {
            backgroundColor = config.backgroundColor
        }
    }
    
    open var itemColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }
    
    open override var isSelected: Bool {
        didSet {
            setNeedsDisplay()
        }
    }
    
    open override func draw(_ rect: CGRect) {
        let cornerRadius = config.itemCornerRadius
        let maxCornerRadius = min(bounds.width, bounds.height) * 0.5
        let path = UIBezierPath(roundedRect: rect, cornerRadius: min(cornerRadius, maxCornerRadius))
        itemColor.setFill()
        path.fill()
        guard isSelected, config.allowItemSelection else { return }
        config.selectedItemBorderColor.setStroke()
        path.lineWidth = config.selectedItemBorderLineWidth
        path.stroke()
    }
}
