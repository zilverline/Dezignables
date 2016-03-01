//
//  DezignableHiddenSections.swift
//  Pods
//
//  Created by Daniel van Hoesel on 01-03-16.
//
//

import Foundation

public protocol DezignableHiddenSections {
  func hideSection(section: Int)
  func showSection(section: Int)
  func isSectionHidden(section: Int) -> Bool
}