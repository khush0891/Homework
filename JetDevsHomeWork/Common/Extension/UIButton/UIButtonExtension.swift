//
//  UIButtonExtension.swift
//  JetDevsHomeWork
//
//  Created by APPLE on 07/12/22.
//

import Foundation
import UIKit


public extension UIButton {
    
    
    func addInterlineSpacingOnButtonTitle(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0, text: String, fontName: String, fontSize: Int, textColor: UIColor, alignment: NSTextAlignment) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.alignment = .center
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: fontName, size: CGFloat(fontSize)) as Any, range: NSMakeRange(0, attributedString.length))
    }
        
        
        
}
