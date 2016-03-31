//
//  PrototypeTableViewCell.swift
//  Dezignables
//
//  Created by Daniel van Hoesel on 29-02-16.
//  Copyright © 2016 Zilverline. All rights reserved.
//

import Dezignables
import UIKit

class PrototypeTableViewCell: DezignableTableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  
  func setupCell(name: String) {
    self.nameLabel.text = name
  }
  
}
