import UIKit
import XCTest
import Dezignables

class DezignableRotationTests: Base {
  
  func testRotation() {
    let dezignableView = DezignableView(frame: CGRectMake(0, 0, 200, 200))
    dezignableView.backgroundColor = UIColor.redColor()
    dezignableView.rotation = 45
    FBSnapshotVerifyView(dezignableView)
  }
  
}