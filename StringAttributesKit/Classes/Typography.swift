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

public class Typography {
    
    public private(set) var attributes: [String: Any] = [NSParagraphStyleAttributeName: NSMutableParagraphStyle.default]
    
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
    
    var backgroundColor: UIColor? {
        set {
            set(key: NSBackgroundColorAttributeName, value: newValue)
        }
        get {
            return attributes[NSBackgroundColorAttributeName] as? UIColor
        }
    }
    
    var baselineOffset: CGFloat? {
        set {
            set(key: NSBaselineOffsetAttributeName, value: newValue)
        }
        get {
            return attributes[NSBaselineOffsetAttributeName] as? CGFloat
        }
    }
    
    var expansion: CGFloat? {
        set {
            set(key: NSExpansionAttributeName, value: newValue)
        }
        get {
            return attributes[NSExpansionAttributeName] as? CGFloat
        }
    }
    
    var font: UIFont? {
        set {
            set(key: NSFontAttributeName, value: newValue)
        }
        get {
            return attributes[NSFontAttributeName] as? UIFont
        }
    }
    
    var foregroundColor: UIColor? {
        set {
            set(key: NSForegroundColorAttributeName, value: newValue)
        }
        get {
            return attributes[NSForegroundColorAttributeName] as? UIColor
        }
    }
    
    var kern: CGFloat? {
        set {
            set(key: NSKernAttributeName, value: newValue)
        }
        get {
            return attributes[NSKernAttributeName] as? CGFloat
        }
    }
    
    var ligature: LigatureStyle? {
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
    
    var link: URL? {
        set {
            set(key: NSLinkAttributeName, value: newValue)
        }
        get {
            return attributes[NSLinkAttributeName] as? URL
        }
    }
    
    var obliqueness: CGFloat? {
        set {
            set(key: NSObliquenessAttributeName, value: newValue)
        }
        get {
            return attributes[NSObliquenessAttributeName] as? CGFloat
        }
    }
    
    
}
