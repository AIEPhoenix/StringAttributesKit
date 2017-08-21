//: Text Attributes Test - Test text attributes's performance.

import UIKit

let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
/*:
 # NSAttachmentAttributeName
 - Swift4: NSAttributedStringKey.attachment
 - value: NSTextAttachment
 - 用于图文混排通常不会通过key-value方式插入
 */
let attachment = NSTextAttachment()
attachment.image = UIImage(named: "test.jpg")
attachment.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
textView.attributedText = NSAttributedString(attachment: attachment)
if let attributeStr = textView.attributedText {
    var patternRange = NSRange(location: NSNotFound, length: 0)
    attributeStr.attribute(NSAttributedStringKey.attachment, at: 0, effectiveRange: &patternRange)
    patternRange
}
//: ***
/*:
 # NSBackgroundColorAttributeName
 - NSAttributedStringKey.backgroundColor
 - value: UIColor
 - 设置背景颜色
 */
textView.attributedText = NSAttributedString(string: "Test", attributes: [NSAttributedStringKey.backgroundColor: UIColor.gray])
//: ***
/*:
 # NSBaselineOffsetAttributeName
 - NSAttributedStringKey.baselineOffset
 - value: 以point为单位，浮点数 正向上偏移，负向下偏移
 */
textView.attributedText = NSAttributedString(string: "Test",
                                             attributes:[NSAttributedStringKey.backgroundColor: UIColor.gray,
                                                         NSAttributedStringKey.baselineOffset: CGFloat(10.0)])
textView.attributedText = NSAttributedString(string: "Test",
                                             attributes:[NSAttributedStringKey.backgroundColor: UIColor.gray,
                                                         NSAttributedStringKey.baselineOffset: -5.0])
//: ***
/*:
 # NSExpansionAttributeName
 - NSAttributedStringKey.expansion
 - value: 浮点数 根据字形横向放大(+)缩小(-)
 */
textView.attributedText = NSAttributedString(string: "Test",
                                             attributes: [NSAttributedStringKey.backgroundColor: UIColor.gray,
                                                          NSAttributedStringKey.expansion: 0.5])
textView.attributedText = NSAttributedString(string: "Test",
                                             attributes: [NSAttributedStringKey.backgroundColor: UIColor.gray,
                                                          NSAttributedStringKey.expansion: -0.5])
//: ***
/*:
 # NSFontAttributeName
 - NSAttributedStringKey.font
 - value: UIFont
 - 设置字体不用多说= =.
 */
//: ***
/*:
 # NSForegroundColorAttributeName
 - NSAttributedStringKey.foregroundColor
 - value: UIColor
 - 设置前景即字体颜色
 */
textView.attributedText = NSAttributedString(string: "Test",
                                             attributes: [NSAttributedStringKey.backgroundColor: UIColor.black,
                                                          NSAttributedStringKey.foregroundColor: UIColor.white])
//: ***
/*:
 # NSKernAttributeName
 - NSAttributedStringKey.kern
 - value: 浮点数 单位point，调整字间距 默认0代表关闭字间距调整，使用字体默认字距
 */
textView.attributedText = NSAttributedString(string: "Test",
                                             attributes: [NSAttributedStringKey.kern: 1.0])
//: ***
/*:
 # NSLigatureAttributeName
 - NSAttributedStringKey.ligature
 - value: 整型 可用值 0 1 2 | 2 在iOS平台不可用 | 1代表使用默认连体 0代表不使用 2代表使用所有连体 ps.仅英文有连体，中文无连体字体
 */
textView.attributedText = NSAttributedString(string: "fight",
                                             attributes: [NSAttributedStringKey.ligature: 0,
                                                          NSAttributedStringKey.font: UIFont(name: "PingFangSC-Regular", size: 16)!])
textView.attributedText = NSAttributedString(string: "fight",
                                             attributes: [NSAttributedStringKey.ligature: 1,
                                                          NSAttributedStringKey.font: UIFont(name: "PingFangSC-Regular", size: 16)!])
//: ***
/*:
 # NSLinkAttributeName
 - NSAttributedStringKey.link
 - value: URL(推荐) or String
 - 文本超链接，默认空间中只有Textview能解析
 */
textView.attributedText = NSAttributedString(string: "Link Test", attributes: [NSAttributedStringKey.link: "https://www.baidu.com"])
textView.linkTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.red]
//: ***
/*:
 # NSObliquenessAttributeName
 - NSAttributedStringKey.obliqueness
 - value: 浮点数 单位point
 - 文字倾斜 正右 负左
 */

//: ***
/*:
 # NSParagraphStyleAttributeName
 - NSAttributedStringKey.paragraphStyle
 - value: NSParagraphStyle 默认为NSParagraphStyle.defalut
 */
//: ***
/*:
 # NSShadowAttributeName
 - NSAttributedStringKey.shadow
 - value: NSShadow
 */
//: ***
/*:
 # NSStrikethroughColorAttributeName
 - NSAttributedStringKey.strikethroughColor
 - value: UIColor
 */
//: ***
/*:
 # NSStrikethroughStyleAttributeName
 - NSAttributedStringKey.strikethroughStyle
 - value: NSUnderlineStyle(enum).rawvalue
 */
//: ***
/*:
 # NSStrokeColorAttributeName 描边颜色
 - NSAttributedStringKey.strokeColor
 - value: UIColor 默认和foregroundColor相同
 */
//: ***
/*:
 # NSStrokeWidthAttributeName 描边宽度
 - NSAttributedStringKey.strokeWidth
 - value: 浮点数 代表描边宽度的point数占字体大小的百分比？
 */
//: ***
/*:
 # NSTextEffectAttributeName
 - NSAttributedStringKey.textEffect
 - value: TextEffectStyle
 */
//: ***
/*:
 # NSUnderlineColorAttributeName
 - NSAttributedStringKey.underlineColor
 - value: UIColor
 */
//: ***
/*:
 # NSUnderlineStyleAttributeName
 - NSAttributedStringKey.underlineStyle
 - value: NSUnderlineStyle.rawvalue
 */
//: ***
/*:
 # NSVerticalGlyphFormAttributeName
 - NSAttributedStringKey.verticalGlyphForm
 - value: 整型 文字方向 0表示横排 1表示竖排 iOS平台下只有横排，其他值都无效
 */
//: ***
/*:
 # NSWritingDirectionAttributeName
 - NSAttributedStringKey.writingDirection
 - value: 整型
 启动从左到右的嵌套 (LRE)
 表示将从左到右嵌套一些文本。例如， 阿拉伯句子中间的英文引用语可被标记为从左到右的嵌套文本。（LRE 影响单词顺序，不影响字符顺序。）
 启动从右到左的嵌套 (RLE)
 表示将从右到左嵌套一些文本。例如，英语引用语中间的希伯来短语可被标记为从右到左的嵌套文本。（RLE 影响单词顺序，不影响字符顺序。）
 启动从左到右的优先 (LRO)
 当需要用于特殊情况（例如，用于部件编号）时，优先于双向字符类型。LRO 强制字符成为从左到右的字符。
 启动从右到左的优先 (RLO)
 当需要用于特殊情况（例如，用于部件编号）时，优先于双向字符类型。RLO 强制字符成为从右到左的字符。
 */
