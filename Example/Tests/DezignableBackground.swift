import UIKit
import XCTest
import FBSnapshotTestCase
import Dezignables

class DezignableBackgroundTests: BaseTestCase {
  
  func testBackgroundFillColor() {
    self.subject.backgroundFillColor = UIColor.greenColor()
    FBSnapshotVerifyView(self.subject)
  }
  
  func testGradient() {
    self.subject.backgroundGradientStartColor = UIColor.greenColor()
    self.subject.backgroundGradientStopColor = UIColor.blueColor()
    FBSnapshotVerifyView(self.subject)
  }
  
  func testGradientPosition() {
    self.subject.backgroundGradientStartColor = UIColor.greenColor()
    self.subject.backgroundGradientStopColor = UIColor.blueColor()
    self.subject.backgroundGradientStartPoint = CGPointMake(1, 1)
    self.subject.backgroundGradientStopPoint = CGPointMake(0, 0)
    FBSnapshotVerifyView(self.subject)
  }
  
}