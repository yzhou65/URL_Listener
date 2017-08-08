//
//  AndyTextView.swift
//  URL_Listener
//
//  Created by Yue Zhou on 8/7/17.
//  Copyright © 2017 Yue Zhou. All rights reserved.
//

import UIKit

class AndyTextView: UITextView {
    
    var ranges: [NSRange] = [NSRange]()
    
    var showWebView: ((_ vc: UIViewController)->())

//    override init(frame: CGRect, textContainer: NSTextContainer?) {
//        super.init(frame: frame, textContainer: textContainer)
//        setupUI()
//    }
    
    init(show: @escaping (_ vc: UIViewController)->()) {
        self.showWebView = show
        super.init(frame: CGRect.zero, textContainer: nil)
        
        setupUI()
    }
    
    
    private func setupUI() {
        backgroundColor = UIColor.lightGray
        font = UIFont.systemFont(ofSize: 24)
        text = "Welcome to Andy's Fortress，http://www.baidu.com. Hello, http://www.facebook.com"
        let maStr = NSMutableAttributedString(string: text)
        
        ranges = urlRegex(with: text, color: UIColor.blue)!
        for range in ranges {
            maStr.addAttributes([NSForegroundColorAttributeName : UIColor.blue, NSFontAttributeName : UIFont.systemFont(ofSize: 24)], range: range)
        }
        
        attributedText = maStr
        
        isEditable = false
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = (touches as NSSet).anyObject() as! UITouch
        let point = touch.location(in: touch.view)
        
        selectedRange = ranges.last!
        let rects = selectionRects(for: selectedTextRange!) as! [UITextSelectionRect]
        
        for selectionRect in rects {
            if selectionRect.rect.contains(point) {
                let urlStr = (text as NSString).substring(with: selectedRange)
//                print("tapped \(urlStr)")
                
                let vc = AndyWebViewController(url: URL(string: urlStr)!)
                
                showWebView(vc)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: url regex
    private func urlRegex(with str: String, color: UIColor) -> [NSRange]? {
        var ranges = [NSRange]()
//        let maStr = NSMutableAttributedString(string: attributedText)
        
        do {
            let dataDetector = try NSDataDetector(types: NSTextCheckingTypes.init(NSTextCheckingResult.CheckingType.link.rawValue))
            let results = dataDetector.matches(in: str, options: NSRegularExpression.MatchingOptions.init(rawValue: 0), range: NSRange(location: 0, length: str.characters.count))
            
            for result in results {
                ranges.append(result.range)
            }
        } catch {
            print(error)
            return nil
        }
        
        return ranges
    }
}
