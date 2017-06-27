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

    func applicationWillFinishLaunching(_ notification: Notification) {
//        _ = NSDocumentController.shared()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {

//        SwiftDocument.init().makeWindowControllers()

        let dc = NSDocumentController.shared()
        dc.openDocument(self)
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












        
    }
}
