//
//  DezignableImageView.swift
//  Pods
//
//  Created by Daniel van Hoesel on 26-02-16.
//
//

import UIKit

@IBDesignable open class DezignableImageView: UIImageView, DezignableBorder, DezignableCorner, DezignableRotation, DezignableBackground, DezignableShadow {
  
  @IBInspectable open var backgroundFillColor: UIColor? = nil {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable open var backgroundGradientStartColor: UIColor? = nil {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable open var backgroundGradientStopColor: UIColor? = nil {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable open var backgroundGradientStartPoint: CGPoint = CGPoint.zero {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable open var backgroundGradientStopPoint: CGPoint = CGPoint.zero {
    didSet {
      self.setupBackground()
    }
  }
  
  @IBInspectable open var borderWidth: CGFloat = CGFloat.nan {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable open var borderColor: UIColor? = nil {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable open var borderTop: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable open var borderBottom: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable open var borderLeft: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable open var borderRight: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable open var borderScaleCorrection: Bool = false {
    didSet {
      self.setupBorder()
    }
  }
  
  @IBInspectable open var cornerRadius: CGFloat = CGFloat.nan {
    didSet {
      self.setupCorner()
    }
  }
  
  @IBInspectable open var cornerCircle: Bool = false {
    didSet {
      self.setupCorner()
    }
  }
  
  @IBInspectable open var rotation: CGFloat = CGFloat.nan {
    didSet {
      self.setupRotation()
    }
  }
  
  @IBInspectable open var boxShadowColor: UIColor? = nil {
    didSet {
      self.setupShadow()
    }
  }
  
  @IBInspectable open var boxShadowRadius: CGFloat = CGFloat.nan {
    didSet {
      self.setupShadow()
    }
  }
  
  @IBInspectable open var boxShadowOpacity: CGFloat = CGFloat.nan {
    didSet {
      self.setupShadow()
    }
  }
  
  @IBInspectable open var boxShadowOffset: CGPoint = CGPoint(x: CGFloat.nan, y: CGFloat.nan) {
    didSet {
      self.setupShadow()
    }
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    self.setupBackground()
    self.setupBorder()
    self.setupCorner()
  }
  
}
