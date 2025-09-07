//
//  RichTextAttribute.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-28.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/// This typealias represents a rich text dictionary key.
public typealias RichTextAttribute = NSAttributedString.Key

/// This typealias represents a dictionary with an attribute
/// as key and `Any` as value.
public typealias RichTextAttributes = [RichTextAttribute: Any]

public extension NSAttributedString.Key {
    /// 文本列表属性键，用于存储 NSTextList 对象
    static let textList = NSAttributedString.Key("NSTextList")
}
