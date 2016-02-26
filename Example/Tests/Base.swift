//
//  Base.swift
//  Dezignables
//
//  Created by Daniel van Hoesel on 26-02-16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import FBSnapshotTestCase
import Dezignables

class Base: FBSnapshotTestCase {

  var subject: DezignableView!
  
  override func setUp() {
    super.setUp()
    self.recordMode = false
    
    self.subject = DezignableView(frame: CGRectMake(0, 0, 200, 200))
    self.subject.backgroundColor = UIColor.redColor()
  }
  
}