//
//  Demo.swift
//  ContactImageView
//
//  Created by George on 2016-05-29.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
import UIKit


class Demo: UIViewController{
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let imageView = ContactImageView(frame: CGRect(x:10, y: 50, width: 100, height: 100))
    
    imageView.setImageText(text: "George Kye", backgroundImage: UIImage(named: "bg"), username: true, textColor: UIColor.white, fillColor: UIColor.black, circle: true)
    
    let imageView2 = ContactImageView(frame: CGRect(x:130, y: 50, width: 100, height: 100))
    imageView2.text = "Joe Swanson"
    imageView2.username = true
    imageView2.textColor = UIColor.purple
    imageView2.circle = false
    imageView2.textFont = UIFont.italicSystemFont(ofSize: 30)
    imageView2.fontSize = 30
    imageView2.fillColor = UIColor.green
    
    self.view.addSubview(imageView)
    self.view.addSubview(imageView2)

  }
  
  
}
