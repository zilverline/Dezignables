import UIKit
import XCTest
import FBSnapshotTestCase
import Dezignables

class DezignableBackgroundTests: BaseTestCase {
  
  func testBackgroundFillColor() {
    self.subject.backgroundFillColor = UIColor.green
    FBSnapshotVerifyView(self.subject)
  }
  
  func testGradient() {
    self.subject.backgroundGradientStartColor = UIColor.green
    self.subject.backgroundGradientStopColor = UIColor.blue
    FBSnapshotVerifyView(self.subject)
  }
  
  func testGradientPosition() {
    self.subject.backgroundGradientStartColor = UIColor.green
    self.subject.backgroundGradientStopColor = UIColor.blue
    self.subject.backgroundGradientStartPoint = CGPoint(x: 1, y: 1)
    self.subject.backgroundGradientStopPoint = CGPoint(x: 0, y: 0)
    FBSnapshotVerifyView(self.subject)
  }
  
}
