//
//  ViewController.swift
//  Dezignables
//
//  Created by Daniel van Hoesel on 02/26/2016.
//  Copyright (c) 2016 Daniel van Hoesel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func tapButton(sender: AnyObject) {
    let alertController = UIAlertController(title: "Tap", message: "Tapped the button", preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    UIApplication.shared.keyWindow!.rootViewController?.present(alertController, animated: true, completion: nil)
  }

}
