//
//  DocumentController.swift
//  DocumentWindow
//
//  Created by wenyou on 2017/6/27.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import AppKit

class DocumentController: NSDocumentController {
    override var defaultType: String? {
        return "txt"
    }
}
