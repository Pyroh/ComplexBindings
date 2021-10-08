//
//  CalculusViewController.swift
//  CalculusViewController
//
//  Created by Pierre Tacchi on 08/10/21.
//  Copyright © 2021 Pierre TACCHI. All rights reserved.
//

import Cocoa



class CalculusEngine: NSObject {
    @objc dynamic var addLeft: NSDecimalNumber! = .zero
    @objc dynamic var addRight: NSDecimalNumber! = .zero
    @objc dynamic var addResult: NSDecimalNumber { add() }
    
    @objc dynamic var subLeft: NSDecimalNumber! = .zero
    @objc dynamic var subRight: NSDecimalNumber! = .zero
    @objc dynamic var subResult: NSDecimalNumber { sub() }
    
    @objc dynamic var mulLeft: NSDecimalNumber! = .zero
    @objc dynamic var mulRight: NSDecimalNumber! = .zero
    @objc dynamic var mulResult: NSDecimalNumber { mul() }
    
    @objc dynamic var divLeft: NSDecimalNumber! = .zero
    @objc dynamic var divRight: NSDecimalNumber! = .zero
    @objc dynamic var divResult: NSDecimalNumber { div() }
    
    func add() -> NSDecimalNumber {
        let left = (addLeft ?? .zero) as Decimal
        let right = (addRight ?? .zero) as Decimal
        
        return (left + right) as NSDecimalNumber
    }
    
    func sub() -> NSDecimalNumber {
        let left = (subLeft ?? .zero) as Decimal
        let right = (subRight ?? .zero) as Decimal
        
        return (left - right) as NSDecimalNumber
    }
    
    func mul() -> NSDecimalNumber {
        let left = (mulLeft ?? .zero) as Decimal
        let right = (mulRight ?? .zero) as Decimal
        
        return (left * right) as NSDecimalNumber
    }
    
    func div() -> NSDecimalNumber {
        let left = (divLeft ?? .zero) as Decimal
        let right = (divRight ?? .zero) as Decimal
        
        return (left / right) as NSDecimalNumber
    }
    
    override class func keyPathsForValuesAffectingValue(forKey key: String) -> Set<String> {
        switch key {
        case "addResult": return ["addLeft", "addRight"]
        case "subResult": return ["subLeft", "subRight"]
        case "mulResult": return ["mulLeft", "mulRight"]
        case "divResult": return ["divLeft", "divRight"]
        default: return super.keyPathsForValuesAffectingValue(forKey: key)
        }
    }
}

class CalculusViewController: NSViewController {
    
}
