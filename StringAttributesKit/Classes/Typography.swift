//
//  Typography.swift
//  StringAttributesKit
//
//  Created by brian on 2017/8/21.
//
//

import Foundation

public enum WritingDirectionStyle: Int {
    case LRE
    case RLE
    case LRO
    case RLO
}

public enum LigatureStyle: Int {
    case none
    case `default`
    case all
}

public enum VerticalGlyphFormStyle: Int {
    case horizontal
    case vertical
}

open class Typography {
    
    public private(set) var attributes: [String: Any] = [String: Any]()
    
    public init(initializeClosure: (Typography) -> Void) {
        initializeClosure(self)
    }
    
    private func set(key: String, value: Any?) {
        guard let value = value else {
            attributes.removeValue(forKey: key)
            return
        }
        attributes[key] = value
    }
    
    public var backgroundColor: UIColor? {
        set {
            set(key: NSBackgroundColorAttributeName, value: newValue)
        }
        get {
            return attributes[NSBackgroundColorAttributeName] as? UIColor
        }
    }
    
    open var baselineOffset: CGFloat? {
        set {
            set(key: NSBaselineOffsetAttributeName, value: newValue)
        }
        get {
            return attributes[NSBaselineOffsetAttributeName] as? CGFloat
        }
    }
    
    open var expansion: CGFloat? {
        set {
            set(key: NSExpansionAttributeName, value: newValue)
        }
        get {
            return attributes[NSExpansionAttributeName] as? CGFloat
        }
    }
    
    open var font: UIFont? {
        set {
            set(key: NSFontAttributeName, value: newValue)
        }
        get {
            return attributes[NSFontAttributeName] as? UIFont
        }
    }
    
    open var foregroundColor: UIColor? {
        set {
            set(key: NSForegroundColorAttributeName, value: newValue)
        }
        get {
            return attributes[NSForegroundColorAttributeName] as? UIColor
        }
    }
    
    open var kern: CGFloat? {
        set {
            set(key: NSKernAttributeName, value: newValue)
        }
        get {
            return attributes[NSKernAttributeName] as? CGFloat
        }
    }
    
    open var ligature: LigatureStyle? {
        set {
            if let newValue = newValue {
                set(key: NSLigatureAttributeName, value: newValue.rawValue)
            }else{
                attributes.removeValue(forKey: NSLigatureAttributeName)
            }
        }
        get {
            if let rawValue = attributes[NSLigatureAttributeName] as? Int {
                return LigatureStyle(rawValue: rawValue)
            } else{
                return nil
            }
        }
    }
    
    open var link: URL? {
        set {
            set(key: NSLinkAttributeName, value: newValue)
        }
        get {
            return attributes[NSLinkAttributeName] as? URL
        }
    }
    
    open var obliqueness: CGFloat? {
        set {
            set(key: NSObliquenessAttributeName, value: newValue)
        }
        get {
            return attributes[NSObliquenessAttributeName] as? CGFloat
        }
    }
    
    open var shadow: NSShadow? {
        set {
            set(key: NSShadowAttributeName, value: newValue)
        }
        get {
            return attributes[NSShadowAttributeName] as? NSShadow
        }
    }
    
    open var strikethroughColor: UIColor? {
        set {
            set(key: NSStrikethroughColorAttributeName, value: newValue)
        }
        get {
            return attributes[NSStrikethroughColorAttributeName] as? UIColor
        }
    }
    
    open var strikethroughStyle: NSUnderlineStyle? {
        set {
            if let newValue = newValue {
                set(key: NSStrikethroughStyleAttributeName, value: newValue.rawValue)
            }else{
                attributes.removeValue(forKey: NSStrikethroughStyleAttributeName)
            }
        }
        get {
            if let rawValue = attributes[NSStrikethroughStyleAttributeName] as? Int {
                return NSUnderlineStyle(rawValue: rawValue)
            } else{
                return nil
            }
        }
    }
    
    open var strokeColor: UIColor? {
        set {
            set(key: NSStrokeColorAttributeName, value: newValue)
        }
        get {
            return attributes[NSStrokeColorAttributeName] as? UIColor
        }
    }
    
    open var strokeWidth: CGFloat? {
        set {
            set(key: NSStrokeWidthAttributeName, value: newValue)
        }
        get {
            return attributes[NSStrokeWidthAttributeName] as? CGFloat
        }
    }
    
    open var textEffect: String? {
        set {
            set(key: NSTextEffectAttributeName, value: newValue)
        }
        get {
            return attributes[NSTextEffectAttributeName] as? String
        }
    }
    
    open var underlineColor: UIColor? {
        set {
            set(key: NSUnderlineColorAttributeName, value: newValue)
        }
        get {
            return attributes[NSUnderlineColorAttributeName] as? UIColor
        }
    }
    
    open var underlineStyle: NSUnderlineStyle? {
        set {
            if let newValue = newValue {
                set(key: NSUnderlineStyleAttributeName, value: newValue.rawValue)
            }else{
                attributes.removeValue(forKey: NSUnderlineStyleAttributeName)
            }
        }
        get {
            if let rawValue = attributes[NSUnderlineStyleAttributeName] as? Int {
                return NSUnderlineStyle(rawValue: rawValue)
            } else{
                return nil
            }
        }
    }
    
    open var writingDirection: WritingDirectionStyle? {
        set {
            if let newValue = newValue {
                set(key: NSWritingDirectionAttributeName, value: newValue.rawValue)
            }else{
                attributes.removeValue(forKey: NSWritingDirectionAttributeName)
            }
        }
        get {
            if let rawValue = attributes[NSWritingDirectionAttributeName] as? Int {
                return WritingDirectionStyle(rawValue: rawValue)
            } else{
                return nil
            }
        }
    }
    
    open var verticalGlyphForm: VerticalGlyphFormStyle? {
        set {
            if let newValue = newValue {
                set(key: NSVerticalGlyphFormAttributeName, value: newValue.rawValue)
            }else{
                attributes.removeValue(forKey: NSVerticalGlyphFormAttributeName)
            }
        }
        get {
            if let rawValue = attributes[NSVerticalGlyphFormAttributeName] as? Int {
                return VerticalGlyphFormStyle(rawValue: rawValue)
            } else{
                return nil
            }
        }
    }
    
    open var paragraphStyle: NSMutableParagraphStyle? {
        set{
            set(key: NSParagraphStyleAttributeName, value: newValue)
        }
        get {
            return mutableParagraphStyle.mutableCopy() as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        }
    }
    
    open var mutableParagraphStyle: NSMutableParagraphStyle {
        get {
            if let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle {
                return style
            } else {
                let style = NSMutableParagraphStyle()
                attributes[NSParagraphStyleAttributeName] = style
                return style
            }
        }
    }
    
    open var lineHeight: CGFloat? {
        set {
            let height = newValue ?? 0
            mutableParagraphStyle.maximumLineHeight = height >= 0 ? height : 0
            mutableParagraphStyle.minimumLineHeight = height >= 0 ? height : 0
        }
        get {
            if mutableParagraphStyle.maximumLineHeight == mutableParagraphStyle.minimumLineHeight {
                return mutableParagraphStyle.minimumLineHeight
            } else {
                return nil
            }
        }
    }
    
    open var minimumLineHeight: CGFloat {
        set {
            mutableParagraphStyle.minimumLineHeight = newValue >= 0 ? newValue : 0
        }
        get {
            return mutableParagraphStyle.minimumLineHeight
        }
    }
    
    open var maximumLineHeight: CGFloat {
        set {
            mutableParagraphStyle.maximumLineHeight = newValue >= 0 ? newValue : 0
        }
        get {
            return mutableParagraphStyle.maximumLineHeight
        }
    }
    
    open var lineSpacing: CGFloat {
        set {
            mutableParagraphStyle.lineSpacing = newValue >= 0 ? newValue : 0
        }
        get {
            return mutableParagraphStyle.lineSpacing
        }
    }
    
    open func setLineHeightByLineSpacingWith(lineHeight: CGFloat, font: UIFont) {
        let calculatedLineSpacing = lineHeight - font.lineHeight
        if calculatedLineSpacing >= 0 {
            lineSpacing = calculatedLineSpacing
            self.font = font
        } else {
            print("StringAttributesKit Warning: setLineHeightByLineSpacingWithLineHeight:\(lineHeight)andFont:\(font) will set an negative value to lineSpacing, so this operation will abandon. Please check UI design~")
        }
    }
    
    open var paragraphSpacing: CGFloat {
        set {
            mutableParagraphStyle.paragraphSpacing = newValue >= 0 ? newValue : 0
        }
        get {
            return mutableParagraphStyle.paragraphSpacing
        }
    }

    open var alignment: NSTextAlignment {
        set {
            mutableParagraphStyle.alignment = newValue
        }
        get {
            return mutableParagraphStyle.alignment
        }
    }

    open var firstLineHeadIndent: CGFloat {
        set {
            mutableParagraphStyle.firstLineHeadIndent = newValue >= 0 ? newValue : 0
        }
        get {
            return mutableParagraphStyle.firstLineHeadIndent
        }
    }
    
    open var headIndent: CGFloat {
        set {
            mutableParagraphStyle.headIndent = newValue >= 0 ? newValue : 0
        }
        get {
            return mutableParagraphStyle.headIndent
        }
    }
    
    open var tailIndent: CGFloat {
        set {
            mutableParagraphStyle.tailIndent = newValue
        }
        get {
            return mutableParagraphStyle.tailIndent
        }
    }
    
    open var lineBreakMode: NSLineBreakMode {
        set {
            mutableParagraphStyle.lineBreakMode = newValue
        }
        get {
            return mutableParagraphStyle.lineBreakMode
        }
    }
    
    open var baseWritingDirection: NSWritingDirection {
        set {
            mutableParagraphStyle.baseWritingDirection = newValue
        }
        get {
            return mutableParagraphStyle.baseWritingDirection
        }
    }
    
    open var lineHeightMultiple: CGFloat {
        set {
            mutableParagraphStyle.lineHeightMultiple = newValue
        }
        get {
            return mutableParagraphStyle.lineHeightMultiple
        }
    }
    
    open var paragraphSpacingBefore: CGFloat {
        set {
            mutableParagraphStyle.paragraphSpacingBefore = newValue
        }
        get {
            return mutableParagraphStyle.paragraphSpacingBefore
        }
    }
    
    open var hyphenationFactor: Float {
        set {
            mutableParagraphStyle.hyphenationFactor = newValue
        }
        get {
            return mutableParagraphStyle.hyphenationFactor
        }
    }
    
    open var tabStops: [NSTextTab] {
        set {
            mutableParagraphStyle.tabStops = newValue
        }
        get {
            return mutableParagraphStyle.tabStops
        }
    }

    open var defaultTabInterval: CGFloat {
        set {
            mutableParagraphStyle.defaultTabInterval = newValue
        }
        get {
            return mutableParagraphStyle.defaultTabInterval
        }
    }
    
    @available(iOS 9.0, *)
    open var allowsDefaultTighteningForTruncation: Bool {
        set {
            mutableParagraphStyle.allowsDefaultTighteningForTruncation = newValue
        }
        get {
            return mutableParagraphStyle.allowsDefaultTighteningForTruncation
        }
    }
    
    @available(iOS 9.0, *)
    open func addTabStop(_ anObject: NSTextTab) {
        mutableParagraphStyle.addTabStop(anObject)
    }
    
    @available(iOS 9.0, *)
    open func removeTabStop(_ anObject: NSTextTab) {
        mutableParagraphStyle.removeTabStop(anObject)
    }
    
}

public extension Typography {
    
}
