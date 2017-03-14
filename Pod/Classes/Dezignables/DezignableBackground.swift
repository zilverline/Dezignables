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
    self.removeExistingBackgroundView()
    
    if self.backgroundFillColor != nil {
      self.createBackgroundFillLayer()
    } else if self.backgroundGradientStartColor != nil && self.backgroundGradientStopColor != nil {
      self.createBackgroundGradientLayer()
    }
  }
  
  fileprivate func removeExistingBackgroundView() {
    self.subviews.forEach({ subview in
      if subview is BackgroundView {
        subview.removeFromSuperview()
      }
    })
  }
  
  fileprivate func createBackgroundFillLayer() {
    let view = BackgroundView(frame: self.bounds)
    let backgroundLayer = CALayer()
    backgroundLayer.name = "dezignableBackgroundLayer"
    backgroundLayer.frame = self.bounds
    backgroundLayer.cornerRadius = self.layer.cornerRadius
    backgroundLayer.backgroundColor = self.backgroundFillColor!.cgColor
    view.layer.addSublayer(backgroundLayer)
    self.insertSubview(view, at: 0)
  }
  
  fileprivate func createBackgroundGradientLayer() {
    let view = BackgroundView(frame: self.bounds)
    let backgroundLayer = CAGradientLayer()
    backgroundLayer.name = "dezignableBackgroundLayer"
    backgroundLayer.frame = self.bounds
    backgroundLayer.cornerRadius = self.layer.cornerRadius
    backgroundLayer.colors = [self.backgroundGradientStartColor!.cgColor, self.backgroundGradientStopColor!.cgColor]
    backgroundLayer.startPoint = self.backgroundGradientStartPoint
    backgroundLayer.endPoint = self.backgroundGradientStopPoint
    view.layer.addSublayer(backgroundLayer)
    self.insertSubview(view, at: 0)
  }
}

private class BackgroundView: UIView {
  
}
