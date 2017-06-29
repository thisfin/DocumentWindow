//
//  TTFDocument.swift
//  DocumentWindow
//
//  Created by wenyou on 2017/6/29.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import AppKit

class TTFDocument: NSDocument {
    var content: String?

    override func makeWindowControllers() {
        let window = NSWindow(contentRect: .zero, styleMask: [.closable, .resizable, .miniaturizable, .titled], backing: .buffered, defer: false)
        window.minSize = NSMakeSize(AppDelegate.windowSize.width, AppDelegate.windowSize.height + 22) // 22 是标题栏的高度
        window.contentViewController = {
            let viewController = ViewController()
            viewController.setContent(content: content != nil ? content! : "")
            return viewController
        }()
        window.isRestorable = false
        window.center()

        let windowController = NSWindowController(window: window)
        addWindowController(windowController)
        NSLog("makeWindowControllers \(windowControllers.count)")
    }

    override func data(ofType typeName: String) throws -> Data {
        Swift.print("data") // 不加 Swift 前缀会调用本类的 print 方法, 大坑
        NSLog("data")
        return Data()
    }

    override func read(from url: URL, ofType typeName: String) throws {
        content = "ttf: \(url.path)"
        NSLog("read: \(data) \(typeName) \(url.path)")
    }
}
