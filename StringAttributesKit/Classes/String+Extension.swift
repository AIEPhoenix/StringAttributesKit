//
//  String+Extension.swift
//  StringAttributesKit
//
//  Created by brian on 2017/8/22.
//
//

import Foundation

public extension String {
    
    public func set(typography: Typography, range: Range<Int>? = nil) -> NSMutableAttributedString {
        guard let range = range else {
            return NSMutableAttributedString(string: self, attributes: typography.attributes)
        }
        let attributedText = NSMutableAttributedString(string: self)
        attributedText.addAttributes(typography.attributes, range: nsRange(from: range))
        return attributedText
    }
}

extension String {
    
    func nsRange(from range: Range<Int>) -> NSRange {
        return nsRange(from: self.range(from: range))
    }
    
    func nsRange(from range: Range<String.Index>) -> NSRange {
        
        let from = range.lowerBound.samePosition(in: utf16)
        let to = range.upperBound.samePosition(in: utf16)
        
        return NSRange(location: utf16.distance(from: utf16.startIndex,
                                                to: from),
                       length: utf16.distance(from: from,
                                              to: to))
    }
    
    func range(from range: Range<Int>) -> Range<String.Index> {
        return index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)
    }
    
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) else {
                return nil
        }
        return from ..< to
    }
}
