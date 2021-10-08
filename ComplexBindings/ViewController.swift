//
//  ViewController.swift
//  ComplexBindings
//
//  Created by Pierre TACCHI on 14/12/2017.
//  Copyright © 2017 Pierre TACCHI. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @objc dynamic var forms: [Form] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        forms = [Square(name: "Square", color: NSColor.red, side: 22),
                 Circle(name: "Circle", color: NSColor.blue, radius: 34)
        ]
    }

    @IBAction func addRectangle(_ sender: Any) {
        let count = forms.filter { $0 is Square }.count
        let num = count > 0 ? " \(count + 1)" : ""
        forms.append(Square(name: "Square\(num)", color: NSColor.red, side: 22))
    }
    
    @IBAction func addCircle(_ sender: Any) {
        let count = forms.filter { $0 is Circle }.count
        let num = count > 0 ? " \(count + 1)" : ""
        forms.append(Circle(name: "Circle\(num)", color: NSColor.blue, radius: 34))
    }
}

