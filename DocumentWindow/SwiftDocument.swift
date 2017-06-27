//
//  SwiftDocument.swift
//  DocumentWindow
//
//  Created by wenyou on 2017/6/26.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import AppKit

class SwiftDocument: NSDocument {
    override func makeWindowControllers() {
        let window = NSWindow(contentRect: .zero, styleMask: [.closable, .resizable, .miniaturizable, .titled], backing: .buffered, defer: false)
        window.minSize = NSMakeSize(AppDelegate.windowSize.width, AppDelegate.windowSize.height + 22) // 22 是标题栏的高度
        window.contentViewController = ViewController()
        window.title = "Document Window"
        window.center()
        let windowController = NSWindowController(window: window)
        window.windowController = windowController
        windowController.document = self

//        let windowController = NSWindowController.init()
//        windowController.contentViewController = ViewController()
//        windowController.document = self

        self.addWindowController(windowController)
//        window.makeKeyAndOrderFront(self)
    }

//    override func printOperation(withSettings printSettings: [String : Any]) throws -> NSPrintOperation {
//        let printOperation = NSPrintOperation(view: (self.windowControllers.last?.contentViewController?.view)!, printInfo: printInfo)
//        return printOperation
//    }

    override func data(ofType typeName: String) throws -> Data {

        print("data")
        return  Data()
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        print("read")
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func printOperation(withSettings printSettings: [String : Any]) throws -> NSPrintOperation {
        return try! super.printOperation(withSettings: printSettings)
    }
}
