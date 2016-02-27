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
  var cornerCircle: Bool { get set }
}

public extension DezignableCorner where Self: UIView {
  public func setupCorner() {
    let cornerRadius: CGFloat
    if self.cornerCircle {
      cornerRadius = self.frame.size.height / 2
    } else {
      cornerRadius = self.cornerRadius
    }
    
    if cornerRadius.isNaN || cornerRadius <= 0 {
      return
    }
    
    self.layer.cornerRadius = cornerRadius
  }
}