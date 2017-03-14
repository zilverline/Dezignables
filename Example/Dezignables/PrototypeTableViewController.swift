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
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return "Section header \(section)"
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath) as! PrototypeTableViewCell
    super.setupCell(cell, forIndexPath: indexPath)
    cell.setupCell(name: "Cell #\(indexPath.row)")
    return cell
  }
  
}
