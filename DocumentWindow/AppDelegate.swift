//
//  AppDelegate.swift
//  DocumentWindow
//
//  Created by wenyou on 2017/6/26.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject {
    static let windowSize = NSMakeSize(800, 600)
    var hasOpenFile = false

    func restoreFinish(_ notification: NSNotification) {
        NSLog("restoreFinish \(NSDocumentController.shared().documents.count)")
    }
}

extension AppDelegate: NSApplicationDelegate {
    func applicationWillFinishLaunching(_ notification: Notification) {
        // NSDocumentController subclass init must at here
        DocumentController.shared()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApplication.shared().menu = {
            let menu = NSMenu()
            menu.addItem({
                let iconfontPreviewItem = NSMenuItem()
                iconfontPreviewItem.submenu = {
                    let submenu = NSMenu()
                    submenu.addItem(NSMenuItem(title: "Open...", action: #selector(NSDocumentController.openDocument(_:)), keyEquivalent: "o"))
                    submenu.addItem(NSMenuItem(title: "New", action: #selector(NSDocumentController.newDocument(_:)), keyEquivalent: "n"))
                    submenu.addItem(NSMenuItem.separator())
                    submenu.addItem(NSMenuItem(title: "About \(ProcessInfo.processInfo.processName)", action: #selector(NSApp.orderFrontStandardAboutPanel(_:)), keyEquivalent: ""))
                    submenu.addItem(NSMenuItem(title: "Close Window", action: #selector(NSWindow.performClose(_:)), keyEquivalent: "w"))
                    submenu.addItem(NSMenuItem(title: "Quit \(ProcessInfo.processInfo.processName)", action: #selector(NSApp.terminate(_:)), keyEquivalent: "q"))
                    return submenu
                }()
                return iconfontPreviewItem
                }())
            return menu
        }()

        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.restoreFinish(_:)), name: .NSApplicationDidFinishRestoringWindows, object: nil)

        NSLog("applicationDidFinishLaunching \(NSDocumentController.shared().documents.count) \(hasOpenFile)")
        if !hasOpenFile {
            NSDocumentController.shared().openDocument(self)
        }
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        NSDocumentController.shared().openDocument(self)
        return false
    }

    // finder 中右键打开, 执行顺序在 applicationDidFinishLaunching 前, 通过一个标志位来做空页面的传递
    func application(_ sender: NSApplication, openFile filename: String) -> Bool {
        NSLog("application openFile")
        hasOpenFile = true
        NSDocumentController.shared().openDocument(withContentsOf: URL.init(fileURLWithPath: filename), display: true) { (document, b, nil) in
        }
        return true
    }
}
