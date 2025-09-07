//
//  RichTextAttributes+RichTextStyle.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-28.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import Foundation

#if macOS
import AppKit
#endif

public extension RichTextAttributes {

    ///  Whether or not the attributes defines strikethrough.
    var isStrikethrough: Bool {
        get { self[.strikethroughStyle] as? Int == 1 }
        set { self[.strikethroughStyle] = newValue ? 1 : 0 }
    }

    ///  Whether or not the attributes defines underline.
    var isUnderlined: Bool {
        get { self[.underlineStyle] as? Int == 1 }
        set { self[.underlineStyle] = newValue ? 1 : 0 }
    }

    ///  Whether or not the attributes defines an unordered list.
    var isUnorderedList: Bool {
        get {
            #if macOS
            guard let textList = self[.textList] as? NSTextList else { return false }
            return textList.markerFormat == "{disc}"
            #else
            return false
            #endif
        }
        set {
            #if macOS
            if newValue {
                let textList = NSTextList(markerFormat: "{disc}", options: 0)
                self[.textList] = textList
            } else {
                self.removeValue(forKey: .textList)
            }
            #endif
        }
    }

    ///  Whether or not the attributes defines an ordered list.
    var isOrderedList: Bool {
        get {
            #if macOS
            guard let textList = self[.textList] as? NSTextList else { return false }
            return textList.markerFormat == "decimal"
            #else
            return false
            #endif
        }
        set {
            #if macOS
            if newValue {
                let textList = NSTextList(markerFormat: "decimal", options: 0)
                self[.textList] = textList
            } else {
                self.removeValue(forKey: .textList)
            }
            #endif
        }
    }
}
