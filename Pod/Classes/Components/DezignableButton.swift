//
//  DezignableButton.swift
//  Pods
//
//  Created by Daniel van Hoesel on 26-02-16.
//
//

import UIKit

@IBDesignable public class DezignableButton: UIButton, DezignableBorder, DezignableCorner, DezignableRotation, DezignableBackground, DezignableShadow {
  
  @IBInspectable public var backgroundFillColor: UIColor? = nil {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable public var backgroundGradientStartColor: UIColor? = nil {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable public var backgroundGradientStopColor: UIColor? = nil {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable public var backgroundGradientStartPoint: CGPoint = CGPoint.zero {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable public var backgroundGradientStopPoint: CGPoint = CGPoint.zero {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable public var borderWidth: CGFloat = CGFloat.NaN {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable public var borderColor: UIColor? = nil {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable public var borderTop: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable public var borderBottom: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable public var borderLeft: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable public var borderRight: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable public var borderScaleCorrection: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable public var cornerRadius: CGFloat = CGFloat.NaN {
    didSet {
      self.setupCorner()
    }
  }
  
  @IBInspectable public var cornerCircle: Bool = false {
    didSet {
      self.setupCorner()
    }
  }
  
  @IBInspectable public var rotation: CGFloat = CGFloat.NaN {
    didSet {
      self.setupRotation()
    }
  }
  
  @IBInspectable public var shadowColor: UIColor? = nil {
    didSet {
      self.setupShadow()
    }
  }
  
  @IBInspectable public var shadowRadius: CGFloat = CGFloat.NaN {
    didSet {
      self.setupShadow()
    }
  }
  
  @IBInspectable public var shadowOpacity: CGFloat = CGFloat.NaN {
    didSet {
      self.setupShadow()
    }
  }
  
  @IBInspectable public var shadowOffset: CGPoint = CGPointMake(CGFloat.NaN, CGFloat.NaN) {
    didSet {
      self.setupShadow()
    }
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    self.setupBackground()
    self.setupBorder()
    self.setupCorner()
  }
  
}