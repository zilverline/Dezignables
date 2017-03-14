//
//  DezignableHiddenSections.swift
//  Pods
//
//  Created by Daniel van Hoesel on 01-03-16.
//
//

import Foundation

public protocol DezignableHiddenSections {
  func hideSection(_ section: Int)
  func showSection(_ section: Int)
  func isSectionHidden(_ section: Int) -> Bool
}
