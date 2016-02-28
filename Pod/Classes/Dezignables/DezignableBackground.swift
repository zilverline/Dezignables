//
//  DezignableBackground.swift
//  Pods
//
//  Created by Daniel van Hoesel on 28-02-16.
//
//

import UIKit

public protocol DezignableBackground {
  var backgroundFillColor: UIColor? { get set }
}

public extension DezignableBackground where Self: UIView {
  public func setupBackground() {
    if self.backgroundFillColor == nil {
      return
    }
    
    self.removeExistingBackgroundLayer()
    self.createBackgroundLayer()
  }
  
  private func removeExistingBackgroundLayer() {
    self.layer.sublayers?.forEach({ layer in
      if layer.name == "dezignableBackgroundLayer" {
        layer.removeFromSuperlayer()
      }
    })
  }
  
  private func createBackgroundLayer() {
    let backgroundLayer = CALayer()
    backgroundLayer.name = "dezignableBackgroundLayer"
    backgroundLayer.backgroundColor = self.backgroundFillColor!.CGColor
    backgroundLayer.frame = self.bounds
    backgroundLayer.cornerRadius = self.layer.cornerRadius
    self.layer.addSublayer(backgroundLayer)
  }
}