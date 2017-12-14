//
//  AppDelegate.swift
//  ComplexBindings
//
//  Created by Pierre TACCHI on 14/12/2017.
//  Copyright © 2017 Pierre TACCHI. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

