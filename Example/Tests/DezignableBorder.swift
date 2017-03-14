import UIKit
import XCTest
import Dezignables

class DezignableBorderTests: BaseTestCase {
  
  func testCombination() {
    self.subject.borderWidth = 5.0
    self.subject.borderTop = true
    self.subject.borderBottom = true
    self.subject.borderLeft = true
    self.subject.borderRight = true
    self.subject.borderColor = UIColor.black
    self.subject.backgroundColor = UIColor.red
    FBSnapshotVerifyView(self.subject)
  }
  
  func testScaleCorrection() {
    self.subject.borderWidth = 1.0
    self.subject.borderTop = true
    self.subject.borderBottom = true
    self.subject.borderLeft = true
    self.subject.borderRight = true
    self.subject.borderColor = UIColor.black
    self.subject.backgroundColor = UIColor.red
    self.subject.borderScaleCorrection = true
    FBSnapshotVerifyView(self.subject)
  }
  
  func testTopBorder() {
    self.subject.borderWidth = 5.0
    self.subject.borderTop = true
    self.subject.borderColor = UIColor.black
    self.subject.backgroundColor = UIColor.red
    FBSnapshotVerifyView(self.subject)
  }
  
  func testLeftBorder() {
    self.subject.borderWidth = 5.0
    self.subject.borderLeft = true
    self.subject.borderColor = UIColor.black
    self.subject.backgroundColor = UIColor.red
    FBSnapshotVerifyView(self.subject)
  }
  
  func testRightBorder() {
    self.subject.borderWidth = 5.0
    self.subject.borderRight = true
    self.subject.borderColor = UIColor.black
    self.subject.backgroundColor = UIColor.red
    FBSnapshotVerifyView(self.subject)
  }
  
  func testBottomBorder() {
    self.subject.borderWidth = 5.0
    self.subject.borderBottom = true
    self.subject.borderColor = UIColor.black
    self.subject.backgroundColor = UIColor.red
    FBSnapshotVerifyView(self.subject)
  }
  
  func testBorderColor() {
    self.subject.borderWidth = 5.0
    self.subject.borderTop = true
    self.subject.borderBottom = true
    self.subject.borderLeft = true
    self.subject.borderRight = true
    self.subject.borderColor = UIColor.blue
    self.subject.backgroundColor = UIColor.red
    FBSnapshotVerifyView(self.subject)
  }
}
