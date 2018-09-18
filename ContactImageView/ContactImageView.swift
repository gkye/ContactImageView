//
//  ContactImageView
//  ContactImageView
//
//  Created by George on 2016-05-29.
//  Copyright © 2016 George Kye. All rights reserved.
//

import UIKit

@IBDesignable public class ContactImageView : UIImageView {
    
    var twoCharacters: Bool = true
    
    /// Sets font for text (Default is UIFont(20) **UIFONT not currently supported in @IBInspectable
    public var textFont: UIFont = UIFont.systemFont(ofSize: 22)
    
    @IBInspectable public var fontSize: CGFloat = 22{
        didSet{
            textFont = textFont.withSize(fontSize)
            setStoryboardImage()
        }
    }
    
    @IBInspectable public var labelFont: String?{
        didSet{
            if let font = labelFont{
                if let setFont = UIFont(name: font, size: fontSize){
                    self.textFont = setFont
                    setStoryboardImage()
                }
            }
        }
    }
    
    /// Sets color of text being displayed, default is white color
    @IBInspectable public var textColor: UIColor = UIColor.white{
        didSet{
            setStoryboardImage()
        }
    }
    
    /// Set text to be displayed in UIImageView, default is "GK".
    @IBInspectable public var text: String = "GK"{
        didSet{
            setStoryboardImage()
        }
    }
    
    @IBInspectable public var username: Bool = false{
        didSet{
            setStoryboardImage()
        }
    }
    
    @IBInspectable public var backgroundImage: UIImage? = nil{
        didSet{
            setStoryboardImage()
        }
    }
    
    /// Returns a circular if set true, default is false
    @IBInspectable public var circle: Bool = true{
        didSet{
            if circle{
                self.layer.cornerRadius = self.bounds.width / 2
            }else{
                self.layer.cornerRadius = 0
            }
        }
    }
    
    /// Set background color your imageview
    @IBInspectable public var fillColor: UIColor = UIColor.lightGray{
        didSet{
            setStoryboardImage()
        }
    }
    
    override public var bounds: CGRect {
        didSet {
            setStoryboardImage()
        }
    }
    
    private func setStoryboardImage(){
        setImageText(text: text, backgroundImage: backgroundImage, username: username, font: textFont, textColor: textColor, fillColor: fillColor, circle: circle)
    }
    
    
    
    public func setImageText(text: String, backgroundImage: UIImage? = nil, username: Bool = false, font: UIFont = UIFont.systemFont(ofSize: 22), textColor: UIColor = UIColor.white, fillColor: UIColor, circle: Bool = true){
        
        var imgText = text
        
        if username{
            imgText = getCharactersFromName(text: text)
        }
        
        let attributes = getAttributedText(text: imgText, color: textColor, textFont: font)
        let attributedText = NSAttributedString(string: imgText, attributes: attributes)
        self.image = createImage(attributedString: attributedText, backgroundImage: backgroundImage, backgroundColor: fillColor)
    }
    
    
    //MARK: Private funcs
    
    /**
     Returns an NSAttribute based on the color and font, size is determined by the number of characters in text
     - parameter text:     size is determined by number of characters
     - parameter color:    color for NSForegroundColorAttribute
     - parameter textFont: font for NSFontAttribute
     
     - returns: [String: AnyObject] to be used as an NSAttribute
     */
    
    func getAttributedText(text: String, color: UIColor, textFont: UIFont) -> [NSAttributedString.Key: AnyObject] {
        let area:CGFloat = self.bounds.width * textFont.pointSize
        let size = sqrt(area / CGFloat(text.count))
        let attribute: [NSAttributedString.Key:AnyObject] = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: textFont.withSize(size)
        ]
        return attribute
    }
    
    /**
     Renders the text into the ImageView
     
     - parameter attributedString: attributes for the text to be rendered
     - parameter backgroundColor:  background color for UIImageVIew
     
     - returns: an ImageView with text rendered
     */
    private func createImage(attributedString: NSAttributedString, backgroundImage: UIImage? = nil, backgroundColor: UIColor) -> UIImage {
        let scale = UIScreen.main.scale
        let bounds = self.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        
        
        if (circle) {
            let path = CGPath(ellipseIn: self.bounds, transform: nil);
            context!.addPath(path)
            context?.clip()
        }
        
        if backgroundImage != nil{
            backgroundImage!.draw(in: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
            
        }else{
            context!.setFillColor(backgroundColor.cgColor)
            context!.fill(CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        }
        
        let textSize = attributedString.size()
        let rect = CGRect(x: bounds.size.width/2 - textSize.width/2, y: bounds.size.height/2 - textSize.height/2, width: textSize.width, height: textSize.height)
        
        attributedString.draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!;
    }
    
    
    /**
     Retrive initals from a full name
     
     - parameter text: full name
     
     - returns: returns a two character string (first inital and last inital
     */
    func getCharactersFromName(text: String) -> String {
        let username = text.components(separatedBy: " ")
        var initial = String()
        if let initalFirst = username.first?.first{
            initial.append(initalFirst)
        }
        if username.count > 1{
            if let initalSecond = username[1].first {
                initial.append(initalSecond)
            }
        }
        return initial
        
    }
    
}
