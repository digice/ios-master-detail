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

  @IBAction func unwindToItems(segue: UIStoryboardSegue) { }
  
  // MARK: - UIViewController

  override func awakeFromNib() {
    super.awakeFromNib()
    ViewManager.shared.items = self
    self.manager.master = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - UITableViewDataSource
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.manager.index.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.manager.index[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: Identifier.itemCell, for: indexPath)
    if let itemCell = cell as? ItemCell {
      let objectIndex = self.manager.index[indexPath.section][indexPath.row]
      itemCell.configureCell(path: indexPath, object: self.manager.objects[objectIndex])
    }
    return cell
  }
  
  // MARK: - UITableViewDelegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let objectIndex = self.manager.index[indexPath.section][indexPath.row]
    self.manager.selected = objectIndex
    self.performSegue(withIdentifier: Identifier.itemsShowItem, sender: nil)
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    self.manager.selected = nil
  }
  
  // MARK: - ItemManagerDelegate

  func itemManagerDidUpdateItems() {
    self.tableView?.reloadData()
  }
  
  func itemManagerDidSelectItem() {
    //
  }

} // ./ItemsController
