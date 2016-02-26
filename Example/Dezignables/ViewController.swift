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
    let alertController = UIAlertController(title: "Tap", message: "Tapped the button", preferredStyle: .Alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    UIApplication.sharedApplication().keyWindow!.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
  }

}