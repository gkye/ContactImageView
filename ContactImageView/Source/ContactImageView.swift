//
//  ViewController.swift
//  ContactImageView
//
//  Created by George on 2016-05-29.
//  Copyright © 2016 George Kye. All rights reserved.
//

import UIKit

@IBDesignable public class ContactImageView : UIImageView {
  
  var twoCharacters: Bool = true
  
  /// Sets font for text (Default is UIFont(20) **UIFONT not currently supported in @IBInspectable
  public var textFont: UIFont = UIFont.systemFontOfSize(22)
  
  @IBInspectable var fontSize: CGFloat = 22{
    didSet{
      textFont = textFont.fontWithSize(fontSize)
      prepareForInterfaceBuilder()
    }
  }
  
  /// Sets color of text being displayed, default is white color
  @IBInspectable public var textColor: UIColor = UIColor.whiteColor(){
    didSet{
      prepareForInterfaceBuilder()
    }
  }
  
  /// Set text to be displayed in UIImageView, default is "GK".
  @IBInspectable var text: String = "GK"{
    didSet{
      prepareForInterfaceBuilder()
    }
  }
  
  @IBInspectable var username: Bool = false{
    didSet{
      prepareForInterfaceBuilder()
    }
  }
  
  ///If true and  text length is greater than two it's truncate to two characters
  @IBInspectable public var twoCharactersOnly: Bool = true{
    didSet{
      prepareForInterfaceBuilder()
    }
  }
  
  /// Returns a circular if set true, default is false
  @IBInspectable var circle: Bool = true{
    didSet{
      prepareForInterfaceBuilder()
    }
  }
  
  /// Set background color your imageview
  @IBInspectable public var fillColor: UIColor = UIColor.lightGrayColor(){
    didSet{
      prepareForInterfaceBuilder()
    }
  }  
  
  override public var bounds: CGRect {
    didSet {
      prepareForInterfaceBuilder()
    }
  }
  
  override public func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setImageText(text: text, username: username, font: textFont, textColor: textColor, fillColor: fillColor, circle: circle, twoCharactersOnly: twoCharactersOnly)
  }
  
  
  public func setImageText(text text: String, username: Bool = false, font: UIFont = UIFont.systemFontOfSize(22), textColor: UIColor = UIColor.whiteColor(), fillColor: UIColor, circle: Bool = true, twoCharactersOnly: Bool = true) {
    
    var imgText = text
    
    if username{
      imgText = getCharactersFromName(text)
    }else{
      if self.twoCharactersOnly == true{
        if text.characters.count > 2{
          let index = text.startIndex.advancedBy(2)
          imgText = text.substringToIndex(index)
        }
      }
    }
    
    let attributes = getAttributedText(imgText, color: textColor, textFont: font)
    let attributedText = NSAttributedString(string: imgText, attributes: attributes)
    self.image = createImage(attributedText, backgroundColor: fillColor)
  }
  
  
  //MARK: Private funcs
  
  /**
   Returns an NSAttribute based on the color and font, size is determined by the number of characters in text
   - parameter text:     size is determined by number of characters
   - parameter color:    color for NSForegroundColorAttribute
   - parameter textFont: font for NSFontAttribute
   
   - returns: [String: AnyObject] to be used as an NSAttribute
   */
  
  func getAttributedText(text: String, color: UIColor, textFont: UIFont) -> [String: AnyObject] {
    let area:CGFloat = self.bounds.width * textFont.pointSize
    let size = sqrt(area / CGFloat(text.characters.count))
    let attribute:[String:AnyObject] = [NSForegroundColorAttributeName: color, NSFontAttributeName: textFont.fontWithSize(size)]
    return attribute
  }
  
  /**
   Renders the text into the ImageView
   
   - parameter attributedString: attributes for the text to be rendered
   - parameter backgroundColor:  background color for UIImageVIew
   
   - returns: an ImageView with text rendered
   */
  private func createImage(attributedString: NSAttributedString, backgroundColor: UIColor) -> UIImage {
    let scale = UIScreen.mainScreen().scale
    let bounds = self.bounds
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
    let context = UIGraphicsGetCurrentContext()
    
    if (circle) {
      let path = CGPathCreateWithEllipseInRect(self.bounds, nil);
      CGContextAddPath(context, path)
      CGContextClip(context)
    }
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor)
    CGContextFillRect(context, CGRectMake(0, 0, bounds.size.width, bounds.size.height))
    
    let textSize = attributedString.size()
    let rect = CGRect(x: bounds.size.width/2 - textSize.width/2, y: bounds.size.height/2 - textSize.height/2, width: textSize.width, height: textSize.height)
    
    attributedString.drawInRect(rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
  }
  
  /**
   Retrive initals from a full name
   
   - parameter text: full name
   
   - returns: returns a two character string (first inital and last inital
   */
  func getCharactersFromName(text: String) -> String {
    let username = text.componentsSeparatedByString(" ")
    var initial = String()
    if let initalFirst = username[0].characters.first {
      initial.append(initalFirst)
    }
    if let initalSecond = username[1].characters.first {
      initial.append(initalSecond)
    }
    return initial
    
  }
}
