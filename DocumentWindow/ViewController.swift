//
//  ViewController.swift
//  DocumentWindow
//
//  Created by wenyou on 2017/6/26.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let textField = NSTextField()

    override func loadView() {
        view = DragView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.cgColor
        view.frame = NSRect(origin: .zero, size: AppDelegate.windowSize)

        textField.frame = view.frame
        textField.alignment = .center
        textField.autoresizingMask = [.viewWidthSizable, .viewHeightSizable]
        textField.isEditable = false
        view.addSubview(textField)
    }

    override func viewWillAppear() {
        super.viewWillAppear()
    }

    override func viewDidAppear() {
        super.viewDidAppear()
    }

    override func viewWillDisappear() {
        super.viewWillDisappear()
    }

    override func viewDidDisappear() {
        super.viewDidDisappear()
    }

    func setContent(content: String) {
        textField.stringValue = content
    }
}
