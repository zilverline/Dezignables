//
//  DezignableTableViewController.swift
//  Pods
//
//  Created by Daniel van Hoesel on 29-02-16.
//
//

import UIKit

@IBDesignable open class DezignableTableViewController: UITableViewController, DezignableSeparator, DezignableHiddenSections, DezignableHighlight, DezignableStatusBar, DezignableHiddenNavigationBar {
  @IBInspectable open var separatorColor: UIColor? = nil
  @IBInspectable open var separatorWidth: CGFloat = CGFloat.nan
  @IBInspectable open var separatorScaleCorrection: Bool = false
  @IBInspectable open var selectedBackgroundColor: UIColor? = nil
  @IBInspectable open var highlightBackgroundColor: UIColor? = nil
  @IBInspectable open var normalBackgroundColor: UIColor? = nil
  @IBInspectable open var navigationBarHidden: Bool = false
  @IBInspectable open var statusBarLight: Bool = false
  @IBInspectable open var statusBarHidden: Bool = false
  
  fileprivate var hiddenSections = [Int]()
  fileprivate var savedSelectedIndexPath: IndexPath?
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    if self.separatorColor != nil && !self.separatorWidth.isNaN && self.separatorWidth > 0 {
      self.tableView.separatorStyle = .none
    }
    self.clearsSelectionOnViewWillAppear = false
  }
  
  override open var preferredStatusBarStyle : UIStatusBarStyle {
    return self.statusBarLight ? .lightContent : .default
  }
  
  override open var prefersStatusBarHidden : Bool {
    return self.statusBarHidden
  }
  
  override open func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.savedSelectedIndexPath = nil
  }
  
  override open func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    if let indexPath = self.savedSelectedIndexPath {
      self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
    }
    self.resetHiddenNavigationBar()
  }
  
  override open func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.savedSelectedIndexPath = tableView.indexPathForSelectedRow
    if let indexPath = self.savedSelectedIndexPath {
      self.tableView.deselectRow(at: indexPath, animated: true)
    }
    self.setupHiddenNavigationBar()
  }
  
  open func hideSection(_ section: Int) {
    self.hiddenSections.append(section)
  }
  
  open func showSection(_ section: Int) {
    self.hiddenSections = self.hiddenSections.filter({ $0 != section })
  }
  
  open func isSectionHidden(_ section: Int) -> Bool {
    return self.hiddenSections.contains(section)
  }
  
  override open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    if self.isSectionHidden(section) {
      return 0.1
    } else {
      return super.tableView(tableView, heightForFooterInSection: section)
    }
  }
  
  override open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if self.isSectionHidden(section) {
      return 0.1
    } else {
      return tableView.sectionHeaderHeight
    }
  }
  
  override open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    if self.isSectionHidden(section) {
      return UIView()
    }
    return nil
  }
  
  override open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if self.isSectionHidden(section) {
      return UIView()
    }
    return nil
  }
  
  override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if self.isSectionHidden(section) {
      return 0
    } else {
      return super.tableView(tableView, numberOfRowsInSection: section)
    }
  }
  
  override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAt: indexPath)
    if let dezignableCell = cell as? DezignableTableViewCell {
      self.setupCell(dezignableCell, forIndexPath: indexPath)
    }
    return cell
  }
  
  open func setupCell(_ cell: DezignableTableViewCell, forIndexPath indexPath: IndexPath) {
    let maxRowsForThisSection = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
    cell.selectedBackgroundColor = self.selectedBackgroundColor
    cell.normalBackgroundColor = self.normalBackgroundColor
    cell.highlightBackgroundColor = self.highlightBackgroundColor ?? self.selectedBackgroundColor
    cell.backgroundColor = self.normalBackgroundColor // fixes weird bug on iPad, where the background would stay white
    
    if self.separatorColor != nil && !self.separatorWidth.isNaN && self.separatorWidth > 0 {
      cell.borderTop = indexPath.row == 0 && self.tableView.style != .plain
      cell.borderBottom = true
      cell.borderBottomInset = indexPath.row < maxRowsForThisSection - 1 || self.tableView.style == .plain ? self.tableView.separatorInset : UIEdgeInsets.zero
      let width = self.separatorScaleCorrection ? self.separatorWidth / UIScreen.main.scale : self.separatorWidth
      cell.borderTopWidth = width
      cell.borderBottomWidth = width
      cell.borderTopColor = self.separatorColor!
      cell.borderBottomColor = self.separatorColor!
    }
  }
}
