//
//  ContactImageViewTests.swift
//  ContactImageViewTests
//
//  Created by George on 2016-05-29.
//  Copyright © 2016 George Kye. All rights reserved.
//

import XCTest
@testable import ContactImageView

class ContactImageViewTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  func testImageNotNil() {
    let imageView = ContactImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    imageView.setImageText(text: "George Kye", fillColor: UIColor.purpleColor())
    XCTAssertNotNil(imageView.image)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock {
      for _ in 0...1500{
        let imageView = ContactImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.setImageText(text: "George Kye", fillColor: UIColor.purpleColor())
      }
    }
  }
  
}
