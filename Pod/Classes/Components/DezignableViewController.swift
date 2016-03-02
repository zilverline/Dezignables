//
//  DezignableViewController.swift
//  Pods
//
//  Created by Daniel van Hoesel on 02-03-16.
//
//

import UIKit

@IBDesignable public class DezignableViewController: UIViewController, DezignableHiddenNavigationBar, DezignableStatusBar {
  @IBInspectable public var navigationBarHidden: Bool = false
  @IBInspectable public var statusBarLight: Bool = false
  @IBInspectable public var statusBarHidden: Bool = false
  
  public override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.setupHiddenNavigationBar()
  }
  
  public override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    self.resetHiddenNavigationBar()
  }
  
  public override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return self.statusBarLight ? .LightContent : .Default
  }
  
  public override func prefersStatusBarHidden() -> Bool {
    return self.statusBarHidden
  }
}

public extension UIViewController {
  @IBAction public func unwindToViewController(sender: UIStoryboardSegue) {
  }
  
  @IBAction public func dismissCurrentViewController(sender: UIStoryboardSegue) {
    sender.sourceViewController.dismissViewControllerAnimated(true, completion: nil)
  }
}