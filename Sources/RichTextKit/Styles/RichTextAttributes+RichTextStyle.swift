//
//  RichTextAttributes+RichTextStyle.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-28.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import Foundation

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
            guard let textList = self[.textList] as? NSTextList else { return false }
            return textList.markerFormat == .bullet
        }
        set {
            if newValue {
                let textList = NSTextList(markerFormat: .bullet, options: 0)
                self[.textList] = textList
            } else {
                self.removeValue(forKey: .textList)
            }
        }
    }

    ///  Whether or not the attributes defines an ordered list.
    var isOrderedList: Bool {
        get { 
            guard let textList = self[.textList] as? NSTextList else { return false }
            return textList.markerFormat == .decimal
        }
        set {
            if newValue {
                let textList = NSTextList(markerFormat: .decimal, options: 0)
                self[.textList] = textList
            } else {
                self.removeValue(forKey: .textList)
            }
        }
    }
}
