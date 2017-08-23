//
//  Format+ShowSizeCalculate.swift
//  StringAttributesKit
//
//  Created by brian on 2017/8/8.
//  Copyright © 2017年 AIEPhoenix All rights reserved.
//

import Foundation

public extension Format {
    
    func calculateTextObjectsShowHeight(forAttrStr attrStr: NSAttributedString,
                                        maxShowWidth: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGFloat {
        return calculateTextObjectsShowSize(forAttrStr: attrStr, maxShowWidth: maxShowWidth).height
    }
    
    func calculateTextObjectsShowSize(forAttrStr attrStr: NSAttributedString,
                                      maxShowWidth: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        return (attrStr.string as NSString).boundingRect(with: CGSize(width: maxShowWidth,
                                                                      height: CGFloat.greatestFiniteMagnitude),
                                                         options: .usesLineFragmentOrigin,
                                                         attributes: attributes,
                                                         context: nil).size
    }
    
    func calculateCoreTextShowHeight(forAttrStr attrStr: NSAttributedString,
                                     maxShowWidth: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGFloat {
        return calculateCoreTextShowSize(forAttrStr: attrStr, maxShowWidth: maxShowWidth).height
    }
    
    func calculateCoreTextShowSize(forAttrStr attrStr: NSAttributedString,
                                   maxShowWidth: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        let framesetter = CTFramesetterCreateWithAttributedString(attrStr)
        
        let suggestSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter,
                                                                       CFRange(location: 0, length: attrStr.length),
                                                                       nil,
                                                                       CGSize(width: maxShowWidth, height: CGFloat.greatestFiniteMagnitude),
                                                                       nil)
        return suggestSize
    }
    
    func calculateShowLineNum(forAttrStr attrStr: NSAttributedString,
                              maxShowWidth: CGFloat = CGFloat.greatestFiniteMagnitude) -> Int {
        let framesetter = CTFramesetterCreateWithAttributedString(attrStr)
        
        let drawingRect = CGRect(x: 0, y: 0, width: maxShowWidth, height: CGFloat.greatestFiniteMagnitude)
        let path = CGPath(rect: drawingRect, transform: nil)
        let textFrame = CTFramesetterCreateFrame(framesetter, CFRange(location: 0, length: 0), path, nil)
        let lines = CTFrameGetLines(textFrame) as [AnyObject]
        
        return lines.count
    }
}
