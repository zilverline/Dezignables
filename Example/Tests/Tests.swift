import UIKit
import XCTest
import FBSnapshotTestCase
import Dezignables

class Tests: FBSnapshotTestCase {
  
  override func setUp() {
    super.setUp()
//    self.recordMode = true
  }
    
  func testDezignableView() {
    let dezignableView = DezignableView(frame: CGRectMake(0, 0, 200, 200))
    dezignableView.borderWidth = 5.0
    dezignableView.borderTop = true
    dezignableView.borderBottom = true
    dezignableView.borderLeft = true
    dezignableView.borderRight = true
    dezignableView.cornerRadius = 20.0
    dezignableView.borderColor = UIColor.blackColor()
    dezignableView.backgroundColor = UIColor.redColor()
    FBSnapshotVerifyView(dezignableView)
  }
  
  func testScaleCorrection() {
    let dezignableView = DezignableView(frame: CGRectMake(0, 0, 200, 200))
    dezignableView.borderWidth = 1.0
    dezignableView.borderTop = true
    dezignableView.borderBottom = true
    dezignableView.borderLeft = true
    dezignableView.borderRight = true
    dezignableView.cornerRadius = 20.0
    dezignableView.borderColor = UIColor.blackColor()
    dezignableView.backgroundColor = UIColor.redColor()
    dezignableView.scaleCorrection = true
    FBSnapshotVerifyView(dezignableView)
  }
  
  func testTopBorder() {
    let dezignableView = DezignableView(frame: CGRectMake(0, 0, 200, 200))
    dezignableView.borderWidth = 5.0
    dezignableView.borderTop = true
    dezignableView.borderColor = UIColor.blackColor()
    dezignableView.backgroundColor = UIColor.redColor()
    FBSnapshotVerifyView(dezignableView)
  }
  
  func testLeftBorder() {
    let dezignableView = DezignableView(frame: CGRectMake(0, 0, 200, 200))
    dezignableView.borderWidth = 5.0
    dezignableView.borderLeft = true
    dezignableView.borderColor = UIColor.blackColor()
    dezignableView.backgroundColor = UIColor.redColor()
    FBSnapshotVerifyView(dezignableView)
  }
  
  func testRightBorder() {
    let dezignableView = DezignableView(frame: CGRectMake(0, 0, 200, 200))
    dezignableView.borderWidth = 5.0
    dezignableView.borderRight = true
    dezignableView.borderColor = UIColor.blackColor()
    dezignableView.backgroundColor = UIColor.redColor()
    FBSnapshotVerifyView(dezignableView)
  }
  
  func testBottomBorder() {
    let dezignableView = DezignableView(frame: CGRectMake(0, 0, 200, 200))
    dezignableView.borderWidth = 5.0
    dezignableView.borderBottom = true
    dezignableView.borderColor = UIColor.blackColor()
    dezignableView.backgroundColor = UIColor.redColor()
    FBSnapshotVerifyView(dezignableView)
  }
  
  func testBorderColor() {
    let dezignableView = DezignableView(frame: CGRectMake(0, 0, 200, 200))
    dezignableView.borderWidth = 5.0
    dezignableView.borderTop = true
    dezignableView.borderBottom = true
    dezignableView.borderLeft = true
    dezignableView.borderRight = true
    dezignableView.borderColor = UIColor.blueColor()
    dezignableView.backgroundColor = UIColor.redColor()
    FBSnapshotVerifyView(dezignableView)
  }
}
