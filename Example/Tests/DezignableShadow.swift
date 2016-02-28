import UIKit
import XCTest
import Dezignables

class DezignableShadowTests: Base {
  
  func testShadow() {
    self.subject.shadowColor = UIColor.blackColor()
    self.subject.shadowRadius = 5.0
    self.subject.shadowOpacity = 1.0
    self.subject.shadowOffset = CGPointMake(0, 0)
    FBSnapshotVerifyView(self.containerView)
  }
  
}