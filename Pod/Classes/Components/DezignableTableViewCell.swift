//
//  DezignableTableViewCell.swift
//  Pods
//
//  Created by Daniel van Hoesel on 29-02-16.
//
//

import UIKit

open class DezignableTableViewCell: UITableViewCell {
  var selectedBackgroundColor: UIColor? = nil
  var highlightBackgroundColor: UIColor? = nil
  var normalBackgroundColor: UIColor? = nil
  var borderTopLayer: CALayer?
  var borderBottomLayer: CALayer?

  var borderTopInset: UIEdgeInsets = UIEdgeInsets.zero {
    didSet {
      self.setupTopBorder()
    }
  }

  var borderBottomInset: UIEdgeInsets = UIEdgeInsets.zero {
    didSet {
      self.setupBottomBorder()
    }
  }

  var borderTopWidth: CGFloat = CGFloat.nan {
    didSet {
      self.setupTopBorder()
    }
  }

  var borderBottomWidth: CGFloat = CGFloat.nan {
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

  override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.setupView()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setupView()
  }

  fileprivate func setupView() {
    self.setupTopBorder()
    self.setupBottomBorder()
  }

  fileprivate func setupTopBorder() {
    if let existingBorder = self.borderTopLayer {
      existingBorder.removeFromSuperlayer()
    }

    if self.borderTop && self.borderTopColor != nil && self.borderTopWidth > 0 {
      let layer = CALayer()
      layer.backgroundColor = self.borderTopColor!.cgColor
      self.borderTopLayer = layer
      self.layer.addSublayer(layer)
    }
  }

  fileprivate func setupBottomBorder() {
    if let existingBorder = self.borderBottomLayer {
      existingBorder.removeFromSuperlayer()
    }

    if self.borderBottom && self.borderBottomColor != nil && self.borderBottomWidth > 0 {
      let layer = CALayer()
      layer.backgroundColor = self.borderBottomColor!.cgColor
      self.borderBottomLayer = layer
      self.layer.addSublayer(layer)
    }
  }

  override open func layoutSubviews() {
    super.layoutSubviews()
    self.layoutBorders()
  }

  fileprivate func layoutBorders() {
    CATransaction.setAnimationDuration(0)
    let cellBounds = self.bounds
    let cellHeight = cellBounds.height
    let cellWidth = cellBounds.width

    if let topBorder = self.borderTopLayer {
      let topFrame = CGRect(x: self.borderTopInset.left, y: self.borderTopInset.top, width: cellWidth - self.borderTopInset.right - self.borderTopInset.left, height: self.borderTopWidth - self.borderTopInset.bottom - self.borderBottomInset.top)
      topBorder.frame = topFrame
    }

    if let bottomBorder = self.borderBottomLayer {
      let bottomFrame = CGRect(x: self.borderBottomInset.left, y: cellHeight - self.borderBottomWidth + self.borderBottomInset.top, width: cellWidth - self.borderBottomInset.right - self.borderBottomInset.left, height: self.borderBottomWidth - self.borderBottomInset.bottom - self.borderBottomInset.top)
      bottomBorder.frame = bottomFrame
    }
  }

  override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
    if self.selectionStyle != .none {
      if let color = self.highlightBackgroundColor {
        self.backgroundColor = highlighted ? color : (self.normalBackgroundColor ?? UIColor.white)
      }

      super.setHighlighted(highlighted, animated: animated)
    }
  }

  override open func setSelected(_ selected: Bool, animated: Bool) {
    if self.selectionStyle != .none {
      if let color = self.selectedBackgroundColor {
        self.selectedBackgroundView = UIView()
        if selected {
          self.backgroundColor = color
          super.setSelected(selected, animated: animated)
        } else {
          UIView.animate(withDuration: 0.4, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.backgroundColor = (self.normalBackgroundColor ?? UIColor.white)
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
