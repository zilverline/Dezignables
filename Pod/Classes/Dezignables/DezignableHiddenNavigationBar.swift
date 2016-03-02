//
//  DezignableHiddenNavigationBar.swift
//  Pods
//
//  Created by Daniel van Hoesel on 02-03-16.
//
//

import UIKit

public protocol DezignableHiddenNavigationBar {
  var navigationBarHidden: Bool { get set }
}

public extension DezignableHiddenNavigationBar where Self: UIViewController {
  public func setupHiddenNavigationBar() {
    self.navigationController?.navigationBarHidden = self.navigationBarHidden
    self.automaticallyAdjustsScrollViewInsets = !self.navigationBarHidden
  }
  
  public func resetHiddenNavigationBar() {
    self.navigationController?.navigationBarHidden = false
    self.automaticallyAdjustsScrollViewInsets = true
  }
}