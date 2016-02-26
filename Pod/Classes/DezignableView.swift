//
//  DezignableImageView.swift
//  Pods
//
//  Created by Daniel van Hoesel on 26-02-16.
//
//

import UIKit

// TODO: do not copy implementation, use protocol extensions
@IBDesignable public class DezignableImageView: UIImageView {
  var borderlayer = CALayer()
  
  @IBInspectable public var borderWidth: CGFloat = 1.0 {
    didSet {
      self.setupBorder()
      self.layoutBorder()
    }
  }
  
  @IBInspectable public var cornerRadius: CGFloat = 0 {
    didSet {
      self.setupBorder()
      self.layoutBorder()
    }
  }

  @IBInspectable public var borderColor: UIColor = UIColor.blackColor() {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable public var borderTop: Bool = false {
    didSet {
      self.layoutBorder()
    }
  }
  
  @IBInspectable public var borderLeft: Bool = false {
    didSet {
      self.layoutBorder()
    }
  }
  
  @IBInspectable public var borderBottom: Bool = false {
    didSet {
      self.layoutBorder()
    }
  }
  
  @IBInspectable public var borderRight: Bool = false {
    didSet {
      self.layoutBorder()
    }
  }
  
  @IBInspectable public var scaleCorrection: Bool = false {
    didSet {
      self.setupBorder()
      self.layoutBorder()
    }
  }
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setupView()
    self.layoutBorder()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.setupView()
    self.layoutBorder()
  }
  
  func setupView() {
    self.clipsToBounds = true

    if self.borderlayer.superlayer == nil {
      self.layer.addSublayer(self.borderlayer)
    }
  }
  
  func setupBorder() {
    self.borderlayer.borderWidth = self.scaledValue(self.borderWidth)
    self.layer.cornerRadius = self.cornerRadius
    self.borderlayer.cornerRadius = self.cornerRadius
    self.borderlayer.borderColor = self.borderColor.CGColor
  }
  
  func scaledValue(value: CGFloat) -> CGFloat {
    if self.scaleCorrection {
      return value / UIScreen.mainScreen().scale
    } else {
      return value
    }
  }
  
  func layoutBorder() {
    CATransaction.setAnimationDuration(0)
    var frame = self.bounds
    
    if !self.borderLeft {
      frame.origin.x -= 1000
      frame.size.width += 1000
    }
    
    if !self.borderTop {
      frame.origin.y -= 1000
      frame.size.height += 1000
    }
    
    if !self.borderBottom {
      frame.size.height += 1000
    }
    
    if !self.borderRight {
      frame.size.width += 1000
    }
    
    self.borderlayer.frame = frame
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    self.layoutBorder()
  }
}