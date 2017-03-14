//
//  DezignableShadow.swift
//  Pods
//
//  Created by Daniel van Hoesel on 28-02-16.
//
//

import UIKit

public protocol DezignableShadow {
  var boxShadowColor: UIColor? { get set }
  var boxShadowRadius: CGFloat { get set }
  var boxShadowOpacity: CGFloat { get set }
  var boxShadowOffset: CGPoint { get set }
}

public extension DezignableShadow where Self: UIView {
  public func setupShadow() {
    guard let shadowColor = self.boxShadowColor else {
      return
    }
    
    self.layer.shadowColor = shadowColor.cgColor
    
    if !self.boxShadowRadius.isNaN && self.boxShadowRadius > 0 {
      self.layer.shadowRadius = self.boxShadowRadius
    }
    
    if !self.boxShadowOpacity.isNaN && self.boxShadowOpacity >= 0 && self.boxShadowOpacity <= 1 {
      self.layer.shadowOpacity = Float(self.boxShadowOpacity)
    } else {
      self.layer.shadowOpacity = 1.0
    }
    
    if !self.boxShadowOffset.x.isNaN {
      self.layer.shadowOffset.width = self.boxShadowOffset.x
    }
    
    if !self.boxShadowOffset.y.isNaN {
      self.layer.shadowOffset.height = self.boxShadowOffset.y
    }
    
    self.layer.masksToBounds = false
  }
}
