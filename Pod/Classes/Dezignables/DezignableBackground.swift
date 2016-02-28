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
  var backgroundGradientStartColor: UIColor? { get set }
  var backgroundGradientStopColor: UIColor? { get set }
  var backgroundGradientStartPoint: CGPoint { get set }
  var backgroundGradientStopPoint: CGPoint { get set }
}

public extension DezignableBackground where Self: UIView {
  public func setupBackground() {
    self.removeExistingBackgroundLayer()
    
    if self.backgroundFillColor != nil {
      self.createBackgroundFillLayer()
    } else if self.backgroundGradientStartColor != nil && self.backgroundGradientStopColor != nil {
      self.createBackgroundGradientLayer()
    }
  }
  
  private func removeExistingBackgroundLayer() {
    self.layer.sublayers?.forEach({ layer in
      if layer.name == "dezignableBackgroundLayer" {
        layer.removeFromSuperlayer()
      }
    })
  }
  
  private func createBackgroundFillLayer() {
    let backgroundLayer = CALayer()
    backgroundLayer.name = "dezignableBackgroundLayer"
    backgroundLayer.frame = self.bounds
    backgroundLayer.cornerRadius = self.layer.cornerRadius
    backgroundLayer.backgroundColor = self.backgroundFillColor!.CGColor
    self.layer.addSublayer(backgroundLayer)
  }
  
  private func createBackgroundGradientLayer() {
    let backgroundLayer = CAGradientLayer()
    backgroundLayer.name = "dezignableBackgroundLayer"
    backgroundLayer.frame = self.bounds
    backgroundLayer.cornerRadius = self.layer.cornerRadius
    backgroundLayer.colors = [self.backgroundGradientStartColor!.CGColor, self.backgroundGradientStopColor!.CGColor]
    backgroundLayer.startPoint = self.backgroundGradientStartPoint
    backgroundLayer.endPoint = self.backgroundGradientStopPoint
    self.layer.addSublayer(backgroundLayer)
  }
}