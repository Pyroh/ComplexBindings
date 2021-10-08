//
//  Form.swift
//  ComplexBindings
//
//  Created by Pierre TACCHI on 14/12/2017.
//  Copyright © 2017 Pierre TACCHI. All rights reserved.
//

import Cocoa

class Form: NSObject {
    final class Center: NSObject {
        @objc dynamic var x: CGFloat
        @objc dynamic var y: CGFloat
        
        var point: CGPoint {
            return CGPoint(x: x, y: y)
        }
        
        init(point: CGPoint) {
            self.x = point.x
            self.y = point.y
        }
    }
    
    @objc dynamic var name: String
    @objc dynamic var color: NSColor
    @objc dynamic var center: Center
    
    @objc var formKind: String { "No special kind" }
    
    init(name: String, color: NSColor) {
        self.name = name
        self.color = color
        self.center = Center(point: .zero)
    }
}

class Square: Form {
    @objc dynamic var side: Double
    override var formKind: String { "Square" }
    
    init(name: String, color: NSColor, side: Double) {
        self.side = side
        super.init(name: name, color: color)
    }
}

class Circle: Form {
    @objc dynamic var radius: Double
    override var formKind: String { "Circle" }
    
    init(name: String, color: NSColor, radius: Double) {
        self.radius = radius
        super.init(name: name, color: color)
    }
}
