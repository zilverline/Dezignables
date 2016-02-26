//
//  DezignableCorner.swift
//  Pods
//
//  Created by Daniel van Hoesel on 26-02-16.
//
//

import UIKit

public protocol DezignableCorner {
  var cornerRadius: CGFloat { get set }
}

public extension DezignableCorner where Self: UIView {
  public func setupCorner() {
    if self.cornerRadius.isNaN || self.cornerRadius <= 0 {
      return
    }
    
    self.layer.cornerRadius = self.cornerRadius
  }
}