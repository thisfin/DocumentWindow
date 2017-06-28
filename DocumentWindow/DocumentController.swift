//
//  DocumentController.swift
//  DocumentWindow
//
//  Created by wenyou on 2017/6/27.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import AppKit

class DocumentController: NSDocumentController {
    override static func restoreWindow(withIdentifier identifier: String, state: NSCoder, completionHandler: @escaping (NSWindow?, Error?) -> Swift.Void) {
        NSLog("restoreWindow")
        super.restoreWindow(withIdentifier: identifier, state: state, completionHandler: completionHandler)
    }
}
