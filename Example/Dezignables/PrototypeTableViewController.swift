//
//  PrototypeTableViewController.swift
//  Dezignables
//
//  Created by Daniel van Hoesel on 29-02-16.
//  Copyright © 2016 Zilverline. All rights reserved.
//

import Dezignables
import UIKit

class PrototypeTableViewController: DezignableTableViewController {

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Section header \(section)"
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("prototypeCell", forIndexPath: indexPath) as! PrototypeTableViewCell
    super.setupCell(cell, forIndexPath: indexPath)
    cell.setupCell("Cell #\(indexPath.row)")
    return cell
  }
  
}
