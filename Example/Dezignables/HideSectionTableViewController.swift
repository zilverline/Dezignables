//
//  HideSectionTableViewController.swift
//  Dezignables
//
//  Created by Daniel van Hoesel on 29-02-16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Dezignables

class HideSectionTableViewController: DezignableTableViewController {

  @IBAction func toggleHideSection(sender: AnyObject) {
    if self.isSectionHidden(1) {
      self.showSection(1)
    } else {
      self.hideSection(1)
    }
    self.tableView.reloadData()
  }
  
}
