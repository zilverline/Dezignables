import UIKit
import XCTest
import Dezignables

class DezignableCornerTests: Base {
  
  func testCorner() {
    self.subject.cornerRadius = 20.0
    FBSnapshotVerifyView(self.subject)
  }
  
  func testCircle() {
    self.subject.cornerCircle = true
    FBSnapshotVerifyView(self.subject)
  }
  
}