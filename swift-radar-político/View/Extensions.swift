//
//  Extensions.swift
//  swift-radar-político
//
//  Created by Ulysses on 4/9/16.
//  Copyright © 2016 Francisco José A. C. Souza. All rights reserved.
//

import Foundation


extension UIView {
    
    func cropToCircle(){
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.clipsToBounds = true
    }
    
    func roundCorner(){
        self.layer.cornerRadius = 6.0
        self.clipsToBounds = true
    }
    
    func highlightCorner(){
        self.layer.borderColor = UIColor(netHex: Constants.green).CGColor
        self.layer.borderWidth = 2.0
    }
    
    func unhighlightCorner(){
        self.layer.borderWidth = 0.0
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

extension NSDate{
    
    func getFormatedDateString()->String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        dateFormatter.timeZone = NSTimeZone.systemTimeZone()
        return dateFormatter.stringFromDate(self)
    }
}

extension String {
    
    func calculateHeightForString(fontSize:CGFloat, screnSize:CGSize, padding:CGFloat) -> CGFloat{
        let attributes = [NSFontAttributeName: UIFont.systemFontOfSize(fontSize)]
        let attrString:NSAttributedString? = NSAttributedString(string: self, attributes: attributes)
        
        let rect:CGRect = attrString!.boundingRectWithSize(CGSizeMake(screnSize.width-padding,CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context:nil )
        
        let requredSize:CGRect = rect
        return requredSize.height
    }
    
}



