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

class BaseTestCase: FBSnapshotTestCase {

  var subject: DezignableView!
  var containerView: UIView!
  
  override func setUp() {
    super.setUp()
    self.recordMode = false
    
    self.containerView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    self.subject = DezignableView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))

    self.subject.backgroundColor = UIColor.red
    self.containerView.addSubview(self.subject)
  }
  
}
