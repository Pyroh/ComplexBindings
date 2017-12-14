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
        forms.append(Square(name: "Square", color: NSColor.red, side: 22))
    }
    
    @IBAction func addCircle(_ sender: Any) {
        forms.append(Circle(name: "Circle", color: NSColor.blue, radius: 34))
    }
}

