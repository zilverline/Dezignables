import UIKit
import XCTest
import Dezignables

class DezignableRotationTests: BaseTestCase {
  
  func testRotation() {
    self.subject.rotation = 45
    FBSnapshotVerifyView(self.subject)
  }
  
}