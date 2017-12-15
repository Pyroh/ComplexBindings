//
//  ColorWell.swift
//  ComplexBindings
//
//  Created by Pierre TACCHI on 15/12/2017.
//  Copyright © 2017 Pierre TACCHI. All rights reserved.
//

import Cocoa

open class ColorWell: NSColorWell {
    override open class func defaultPlaceholder(forMarker marker: Any?, withBinding binding: NSBindingName) -> Any? {
        guard binding == .value else {
            return NSColorWell.defaultPlaceholder(forMarker: marker, withBinding: binding)
        }
        if NSMultipleValuesMarker.isEqual(marker) {
            return NSColor(patternImage: #imageLiteral(resourceName: "MultiplePlaceholderColorWellPattern"))
        } else if NSNotApplicableMarker.isEqual(marker) {
            return NSColor(patternImage: #imageLiteral(resourceName: "NotApplicablePlaceholderColorWellPattern"))
        } else if NSNoSelectionMarker.isEqual(marker) {
            return NSColor(patternImage: #imageLiteral(resourceName: "NoSelectionPlaceholderColorWellPattern"))
        } else {
            return NSColorWell.defaultPlaceholder(forMarker: marker, withBinding: binding)
        }
    }
    
    override open func draw(_ dirtyRect: NSRect) {
        let wellRect: NSRect
        let alignRect = self.alignmentRect(forFrame: bounds)
        if self.isBordered {
            wellRect = alignRect.insetBy(dx: 3, dy: 3)
            self.drawBorder(inside: alignRect)
        } else {
            wellRect = bounds.insetBy(dx: 1, dy: 1)
        }
        self.drawWell(inside: wellRect)
    }
    
    override open func drawWell(inside insideRect: NSRect) {
        let path = NSBezierPath(roundedRect: insideRect.insetBy(dx: 1, dy: 1), xRadius: 3.0, yRadius: 3.0)
        if color.alphaComponent < 1 {
            NSColor(patternImage: #imageLiteral(resourceName: "AlphaBack")).setFill()
            path.fill()
        }
        path.lineWidth = 1.0
        color.setFill()
        NSColor.black.withAlphaComponent(0.24).setStroke()
        path.fill()
        path.stroke()
    }
    
    open func drawBorder(inside borderRect: NSRect) {
        let ctx = NSGraphicsContext.current?.cgContext
        let path = CGPath(roundedRect: borderRect, cornerWidth: 4.0, cornerHeight: 4.0, transform: nil)
        ctx?.setLineWidth(1.0)
        ctx?.setStrokeColor(NSColor(calibratedWhite: 0.4431372549, alpha: 0.23).cgColor)
        ctx?.addPath(path)
        ctx?.strokePath()
        ctx?.saveGState()
        let fillColor = isEnabled ? isActive ? NSColor.controlHighlightColor.cgColor : NSColor.controlBackgroundColor.cgColor : NSColor.windowBackgroundColor.cgColor
        ctx?.setFillColor(fillColor)
        if isEnabled { ctx?.setShadow(offset: CGSize(width: 0, height: -1), blur: 2.0, color: NSColor.black.withAlphaComponent(0.19).cgColor) }
        ctx?.addPath(path)
        ctx?.fillPath()
        ctx?.restoreGState()
    }
    
    override open var alignmentRectInsets: NSEdgeInsets {
        return NSEdgeInsets(top: 2, left: 3, bottom: 4, right: 3)
    }
}
