//
//  AppDelegate.swift
//  DocumentWindow
//
//  Created by wenyou on 2017/6/26.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    static let windowSize = NSMakeSize(800, 600)
    var window: NSWindow!

//    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
//        <#code#>
//    }

//    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
//        NSLog("applicationShouldHandleReopen \(flag)")
//        return false
//    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func applicationWillFinishLaunching(_ notification: Notification) {
        // NSDocumentController subclass init must at here
        DocumentController.shared()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {

//        SwiftDocument.init().makeWindowControllers()

//        let dc = NSDocumentController.shared()
//        dc.openDocument(self)

//dc.newDocument(nil)

//        dc.openDocument(self)

//        let panel = NSOpenPanel()
//        panel.allowsMultipleSelection = false
//        panel.canChooseFiles = true
//        panel.canChooseDirectories = false
//        panel.canCreateDirectories = false
//        panel.allowedFileTypes = ["swift"]
//        panel.message = "select .ttf file"
//        dc.beginOpenPanel(panel, forTypes: ["swift"]) { (i) in
//            if i == NSModalResponseOK, let url = panel.url {
//                var a: Error?
//                dc.openDocument(withContentsOf: url, display: true, completionHandler: { (document, b, a) in
//                    print("\(a)")
//                    print("\(String(describing: document))")
//                })
////                let a = try! dc.makeDocument(withContentsOf: url, ofType: "swift")
////                print("\(a)")
//            }
//        }



//        let dvc = NSDocumentController.shared()
//        let url = URL(fileURLWithPath: NSHomeDirectory() + "Desktop/hosts")
//
//
////        _ = try! dvc.openUntitledDocumentAndDisplay(true)
//        dvc.openDocument(withContentsOf: url, display: true) { (document, true, nil) in
//            print("\(String(describing: document))")
//        }
//
//        let panel = NSOpenPanel()
//        panel.allowsMultipleSelection = false
//        panel.canChooseFiles = true
//        panel.canChooseDirectories = false
//        panel.canCreateDirectories = false
//        panel.allowedFileTypes = ["swift"]
//        panel.message = "select .ttf file"
//        dvc.beginOpenPanel(panel, forTypes: nil) { (i) in
//            if i == NSOKButton {
//
//            }
//        }





        NSApplication.shared().menu = {
            let menu = NSMenu()
            menu.addItem({
                let iconfontPreviewItem = NSMenuItem()
                iconfontPreviewItem.submenu = {
                    let submenu = NSMenu()
                    submenu.addItem(NSMenuItem(title: "Open...", action: #selector(NSDocumentController.openDocument(_:)), keyEquivalent: "o"))
                    submenu.addItem(NSMenuItem(title: "Open...", action: #selector(AppDelegate.openDocument(_:)), keyEquivalent: "p"))
                    submenu.addItem(NSMenuItem(title: "New", action: #selector(NSDocumentController.newDocument(_:)), keyEquivalent: "n"))
                    submenu.addItem(NSMenuItem.separator())
                    submenu.addItem(NSMenuItem(title: "About \(ProcessInfo.processInfo.processName)", action: #selector(NSApp.orderFrontStandardAboutPanel(_:)), keyEquivalent: ""))
                    submenu.addItem(NSMenuItem(title: "Quit \(ProcessInfo.processInfo.processName)", action: #selector(NSApp.terminate(_:)), keyEquivalent: "q"))
                    return submenu
                }()
                return iconfontPreviewItem
                }())
            return menu
        }()

        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.restoreFinish(_:)), name: .NSApplicationDidFinishRestoringWindows, object: nil)

        NSLog("applicationDidFinishLaunching \(NSDocumentController.shared().documents.count)")

//        if NSDocumentController.shared().documents.count == 0 {
//            NSDocumentController.shared().openDocument(nil)
//        }
    }

    func openDocument(_ sender: NSMenuItem) {
        NSDocumentController.shared().openDocument(sender)
    }

    func restoreFinish(_ notification: NSNotification) {
        NSLog("restoreFinish \(NSDocumentController.shared().documents.count)")
    }
}
