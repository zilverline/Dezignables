//
//  DezignableButton.swift
//  Pods
//
//  Created by Daniel van Hoesel on 26-02-16.
//
//

import UIKit

@IBDesignable public class DezignableButton: UIButton, DezignableBorder, DezignableCorner, DezignableRotation {
  
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
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    self.setupBorder()
  }
  
}