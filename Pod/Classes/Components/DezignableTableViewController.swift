//
//  DezignableTableViewController.swift
//  Pods
//
//  Created by Daniel van Hoesel on 29-02-16.
//
//

import UIKit

@IBDesignable public class DezignableTableViewController: UITableViewController, DezignableSeparator, DezignableHiddenSections, DezignableHighlight {
  @IBInspectable var separatorColor: UIColor? = nil
  @IBInspectable var separatorWidth: CGFloat = CGFloat.NaN
  @IBInspectable var separatorScaleCorrection: Bool = false
  @IBInspectable var selectedBackgroundColor: UIColor? = nil
  @IBInspectable var normalBackgroundColor: UIColor? = nil
  
  private var hiddenSections = [Int]()
  private var savedSelectedIndexPath: NSIndexPath?
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    if self.separatorColor != nil && !self.separatorWidth.isNaN && self.separatorWidth > 0 {
      self.tableView.separatorStyle = .None
    }
    self.clearsSelectionOnViewWillAppear = false
  }
  
  override public func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    self.savedSelectedIndexPath = nil
  }
  
  override public func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    if let indexPath = self.savedSelectedIndexPath {
      self.tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None)
    }
  }
  
  override public func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.savedSelectedIndexPath = tableView.indexPathForSelectedRow
    if let indexPath = self.savedSelectedIndexPath {
      self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
  }
  
  public func hideSection(section: Int) {
    self.hiddenSections.append(section)
  }
  
  public func showSection(section: Int) {
    self.hiddenSections = self.hiddenSections.filter({ $0 != section })
  }
  
  public func isSectionHidden(section: Int) -> Bool {
    return self.hiddenSections.contains(section)
  }
  
  override public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    if self.isSectionHidden(section) {
      return 0.1
    } else {
      return super.tableView(tableView, heightForHeaderInSection: section)
    }
  }
  
  override public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if self.isSectionHidden(section) {
      return 0.1
    } else {
      return tableView.sectionHeaderHeight
    }
  }
  
  override public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    if self.isSectionHidden(section) {
      return UIView()
    }
    return nil
  }
  
  override public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if self.isSectionHidden(section) {
      return UIView()
    }
    return nil
  }
  
  override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if self.isSectionHidden(section) {
      return 0
    } else {
      return super.tableView(tableView, numberOfRowsInSection: section)
    }
  }
  
  override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
    if let dezignableCell = cell as? DezignableTableViewCell {
      self.setupCell(dezignableCell, forIndexPath: indexPath)
    }
    return cell
  }
  
  public func setupCell(cell: DezignableTableViewCell, forIndexPath indexPath: NSIndexPath) {
    let maxRowsForThisSection = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
    cell.selectedBackgroundColor = self.selectedBackgroundColor
    cell.normalBackgroundColor = self.normalBackgroundColor
    
    if self.separatorColor != nil && !self.separatorWidth.isNaN && self.separatorWidth > 0 {
      cell.borderTop = indexPath.row == 0 && self.tableView.style != .Plain
      cell.borderBottom = true
      cell.borderBottomInset = indexPath.row < maxRowsForThisSection - 1 || self.tableView.style == .Plain ? self.tableView.separatorInset : UIEdgeInsetsZero
      let width = self.separatorScaleCorrection ? self.separatorWidth / UIScreen.mainScreen().scale : self.separatorWidth
      cell.borderTopWidth = width
      cell.borderBottomWidth = width
      cell.borderTopColor = self.separatorColor!
      cell.borderBottomColor = self.separatorColor!
    }
  }
}