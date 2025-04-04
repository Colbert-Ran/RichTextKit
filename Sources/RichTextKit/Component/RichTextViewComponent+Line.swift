//
//  RichTextViewComponent+Line.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-02-16.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#endif

public extension RichTextViewComponent {

    /// Get the current line spacing.
    var richTextLineSpacing: CGFloat? {
        richTextParagraphStyleValue(\.lineSpacing)
    }

    /// Set the current line spacing.
    func setRichTextLineSpacing(_ spacing: CGFloat) {
        setRichTextParagraphStyleValue(\.lineSpacing, spacing)
    }

    /// Step the current line spacing.
    func stepRichTextLineSpacing(points: CGFloat) {
        stepRichTextParagraphStyleValue(\.lineSpacing, points)
    }
}
