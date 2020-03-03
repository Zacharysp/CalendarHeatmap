//
//  CalendarHeatmapCell.swift
//  fill-it-up
//
//  Created by Dongjie Zhang on 1/31/20.
//  Copyright © 2020 Zachary. All rights reserved.
//

import UIKit

open class CalendarHeatmapCell: UICollectionViewCell {
    
    open var itemColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
    }
    
    open override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: min(bounds.width, bounds.height) * 0.2)
        itemColor.setFill()
        path.fill()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("no storyboard implementation, should not enter here")
    }
}
