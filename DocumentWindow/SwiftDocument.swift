//
//  SwiftDocument.swift
//  DocumentWindow
//
//  Created by wenyou on 2017/6/26.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import AppKit

class SwiftDocument: NSDocument {
    var wc: NSWindowController?


//    override class func autosavesInPlace() -> Bool {
//        return false
//    }

    override func makeWindowControllers() {
        let window = NSWindow(contentRect: .zero, styleMask: [.closable, .resizable, .miniaturizable, .titled], backing: .buffered, defer: false)
        window.minSize = NSMakeSize(AppDelegate.windowSize.width, AppDelegate.windowSize.height + 22) // 22 是标题栏的高度
        window.contentViewController = ViewController()
        window.title = "Document Window"
        window.center()
        window.isRestorable = false

        let windowController = NSWindowController(window: window)
//        window.windowController = windowController
//        windowController.document = self

//        self.setWindow(window)

//        let windowController = NSWindowController.init()
//        windowController.contentViewController = ViewController()
//        windowController.document = self
//wc = windowController
        addWindowController(windowController)
//        window.makeKeyAndOrderFront(self)
//window.makeKeyAndOrderFront(self)

//        showWindows()
        NSLog("makeWindowControllers \(windowControllers.count)")


//        let windowController = NSWindowController()
//        windowController.contentViewController = ViewController()
//        self.addWindowController(windowController)
    }

//    override func printOperation(withSettings printSettings: [String : Any]) throws -> NSPrintOperation {
//        let printOperation = NSPrintOperation(view: (self.windowControllers.last?.contentViewController?.view)!, printInfo: printInfo)
//        return printOperation
//    }


    override func data(ofType typeName: String) throws -> Data {
        Swift.print("data")
        NSLog("data")
        return Data()
    }
    override func read(from url: URL, ofType typeName: String) throws {
//    override func read(from data: Data, ofType typeName: String) throws {
        NSLog("read: \(data) \(typeName)")
    }
}
