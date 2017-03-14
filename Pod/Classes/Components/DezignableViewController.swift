//
//  DezignableViewController.swift
//  Pods
//
//  Created by Daniel van Hoesel on 02-03-16.
//
//

import UIKit

@IBDesignable open class DezignableViewController: UIViewController, DezignableHiddenNavigationBar, DezignableStatusBar {
  @IBInspectable open var navigationBarHidden: Bool = false
  @IBInspectable open var statusBarLight: Bool = false
  @IBInspectable open var statusBarHidden: Bool = false
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.setupHiddenNavigationBar()
  }
  
  open override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.resetHiddenNavigationBar()
  }
  
  open override var preferredStatusBarStyle : UIStatusBarStyle {
    return self.statusBarLight ? .lightContent : .default
  }
  
  open override var prefersStatusBarHidden : Bool {
    return self.statusBarHidden
  }
}

public extension UIViewController {
  @IBAction public func unwindToViewController(_ sender: UIStoryboardSegue) {
  }
  
  @IBAction public func dismissCurrentViewController(_ sender: UIStoryboardSegue) {
    sender.source.dismiss(animated: true, completion: nil)
  }
}
