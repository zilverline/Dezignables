//
//  DezignableTableViewCell.swift
//  Pods
//
//  Created by Daniel van Hoesel on 29-02-16.
//
//

import UIKit

public class DezignableTableViewCell: UITableViewCell {
  var selectedBackgroundColor: UIColor? = nil
  var highlightBackgroundColor: UIColor? = nil
  var normalBackgroundColor: UIColor? = nil
  var borderTopLayer: CALayer?
  var borderBottomLayer: CALayer?
  
  var borderTopInset: UIEdgeInsets = UIEdgeInsetsZero {
    didSet {
      self.setupTopBorder()
    }
  }
  
  var borderBottomInset: UIEdgeInsets = UIEdgeInsetsZero {
    didSet {
      self.setupBottomBorder()
    }
  }
  
  var borderTopWidth: CGFloat = CGFloat.NaN {
    didSet {
      self.setupTopBorder()
    }
  }
  
  var borderBottomWidth: CGFloat = CGFloat.NaN {
    didSet {
      self.setupBottomBorder()
    }
  }
  
  var borderTopColor: UIColor? = nil {
    didSet {
      self.setupTopBorder()
    }
  }
  
  var borderBottomColor: UIColor? = nil {
    didSet {
      self.setupBottomBorder()
    }
  }
  
  var borderTop: Bool = false {
    didSet {
      self.setupTopBorder()
    }
  }
  
  var borderBottom: Bool = false {
    didSet {
      self.setupBottomBorder()
    }
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.setupView()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setupView()
  }
  
  private func setupView() {
    self.setupTopBorder()
    self.setupBottomBorder()
  }
  
  private func setupTopBorder() {
    if let existingBorder = self.borderTopLayer {
      existingBorder.removeFromSuperlayer()
    }
    
    if self.borderTop && self.borderTopColor != nil && self.borderTopWidth > 0 {
      let layer = CALayer()
      layer.backgroundColor = self.borderTopColor!.CGColor
      self.borderTopLayer = layer
      self.layer.addSublayer(layer)
    }
  }
  
  private func setupBottomBorder() {
    if let existingBorder = self.borderBottomLayer {
      existingBorder.removeFromSuperlayer()
    }
    
    if self.borderBottom && self.borderBottomColor != nil && self.borderBottomWidth > 0 {
      let layer = CALayer()
      layer.backgroundColor = self.borderBottomColor!.CGColor
      self.borderBottomLayer = layer
      self.layer.addSublayer(layer)
    }
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    self.layoutBorders()
  }
  
  private func layoutBorders() {
    CATransaction.setAnimationDuration(0)
    let cellBounds = self.bounds
    let cellHeight = cellBounds.height
    let cellWidth = cellBounds.width
    
    if let topBorder = self.borderTopLayer {
      let topFrame = CGRectMake(self.borderTopInset.left, self.borderTopInset.top, cellWidth - self.borderTopInset.right - self.borderTopInset.left, self.borderTopWidth - self.borderTopInset.bottom - self.borderBottomInset.top)
      topBorder.frame = topFrame
    }
    
    if let bottomBorder = self.borderBottomLayer {
      let bottomFrame = CGRectMake(self.borderBottomInset.left, cellHeight - self.borderBottomWidth + self.borderBottomInset.top, cellWidth - self.borderBottomInset.right - self.borderBottomInset.left, self.borderBottomWidth - self.borderBottomInset.bottom - self.borderBottomInset.top)
      bottomBorder.frame = bottomFrame
    }
  }
  
  override public func setHighlighted(highlighted: Bool, animated: Bool) {
    if self.selectionStyle != .None {
      if let color = self.highlightBackgroundColor {
        self.backgroundColor = highlighted ? color : (self.normalBackgroundColor ?? UIColor.whiteColor())
      }
      
      super.setHighlighted(highlighted, animated: animated)
    }
  }
  
  override public func setSelected(selected: Bool, animated: Bool) {
    if self.selectionStyle != .None {
      if let color = self.selectedBackgroundColor {
        self.selectedBackgroundView = UIView()
        if selected {
          self.backgroundColor = color
          super.setSelected(selected, animated: animated)
        } else {
          UIView.animateWithDuration(0.4, delay: 0, options: [.AllowUserInteraction, .BeginFromCurrentState], animations: {
            self.backgroundColor = (self.normalBackgroundColor ?? UIColor.whiteColor())
          }, completion: { _ in
            super.setSelected(selected, animated: animated)
          })
        }
      } else {
        super.setSelected(selected, animated: animated)
      }
    }
  }
}
