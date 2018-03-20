//
//  ItemsController.swift
//  ios-master-detail
//
//  Created by Roderic Linguri on 3/20/18.
//  Copyright © 2018 Digices LLC. All rights reserved.
//

import UIKit

class ItemsController: UIViewController, UITableViewDataSource, UITableViewDelegate, ItemManagerDelegate {

  // MARK: - Properties

  let manager: ItemManager = ItemManager.shared
  
  // MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Actions

  /**
   * Unwind to Items Action
   * - parameter: UIStoryboardSegue
   */
  @IBAction func unwindToItems(segue: UIStoryboardSegue) { }
  
  // MARK: - UIViewController

  /**
   * Awake from Nib
   */
  override func awakeFromNib() {
    super.awakeFromNib()
    ViewManager.shared.items = self
    self.manager.master = self
  }
  
  /**
   * View Did Load
   */
  override func viewDidLoad() {
    super.viewDidLoad()
  } // ./viewDidLoad
  
  // MARK: - UITableViewDataSource
  
  /**
   * Number of Sections
   * - parameter: UITableView
   * - return:    Int
   */
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.manager.index.count
  } // ./numberOfSections
  
  /**
   * Number of Rows In Section
   * - parameter: UITableView
   * - parameter: Int (section)
   * - return:    Int
   */
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.manager.index[section].count
  } // ./numberOfRowsInSection
  
  /**
   * Cell for Row
   * - parameter: UITableView
   * - parameter: IndexPath
   * - return:    UITableViewCell
   */
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: Identifier.itemCell, for: indexPath)
    if let itemCell = cell as? ItemCell {
      let objectIndex = self.manager.index[indexPath.section][indexPath.row]
      itemCell.configureCell(path: indexPath, object: self.manager.objects[objectIndex])
    }
    return cell
  } // ./cellForRowAtIndexPath
  
  // MARK: - UITableViewDelegate
  
  /**
   * Did Select Row
   * - parameter: UITableView
   * - parameter: IndexPath
   */
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let objectIndex = self.manager.index[indexPath.section][indexPath.row]
    self.manager.selected = objectIndex
    self.performSegue(withIdentifier: Identifier.itemsShowItem, sender: nil)
  } // ./didSelectRow
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    self.manager.selected = nil
  }
  
  // MARK: - ItemManagerDelegate
  
  /**
   * Did Update Items
   */
  func itemManagerDidUpdateItems() {
    self.tableView?.reloadData()
  } // ./didUpdateItem
  
  /**
   * Did Select Item
   */
  func itemManagerDidSelectItem() {
    //
  } // ./didSelectItem
  
} // ./ItemsController
