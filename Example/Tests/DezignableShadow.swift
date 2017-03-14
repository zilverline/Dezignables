import UIKit
import XCTest
import Dezignables

class DezignableShadowTests: BaseTestCase {
  
  func testShadow() {
    self.subject.boxShadowColor = UIColor.black
    self.subject.boxShadowRadius = 5.0
    self.subject.boxShadowOpacity = 1.0
    self.subject.boxShadowOffset = CGPoint(x: 0, y: 0)
    FBSnapshotVerifyView(self.containerView)
  }
  
}
