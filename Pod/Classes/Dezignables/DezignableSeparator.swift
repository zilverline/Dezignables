//
//  DezignableSeparator.swift
//  Pods
//
//  Created by Daniel van Hoesel on 01-03-16.
//
//

import UIKit

protocol DezignableSeparator {
  var separatorColor: UIColor? { get set }
  var separatorWidth: CGFloat { get set }
  var separatorScaleCorrection: Bool { get set }
}