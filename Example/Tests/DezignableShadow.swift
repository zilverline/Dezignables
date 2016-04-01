import UIKit
import XCTest
import Dezignables

class DezignableShadowTests: BaseTestCase {
  
  func testShadow() {
    self.subject.boxShadowColor = UIColor.blackColor()
    self.subject.boxShadowRadius = 5.0
    self.subject.boxShadowOpacity = 1.0
    self.subject.boxShadowOffset = CGPointMake(0, 0)
    FBSnapshotVerifyView(self.containerView)
  }
  
}