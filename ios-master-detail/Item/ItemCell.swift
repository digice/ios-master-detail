//
//  ItemCell.swift
//  ios-master-detail
//
//  Created by Roderic Linguri on 3/20/18.
//  Copyright © 2018 Digices LLC. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
  
  // MARK: - Properties
  
  let manager: ItemManager = ItemManager.shared
  
  var path: IndexPath?
  
  var object: Item?
  
  // MARK: - Outlets
  
  @IBOutlet weak var idLabel: UILabel!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  // MARK: - ItemCell
  
  /**
   * Configure Cell
   * - parameter: IndexPath
   * - parameter: Item
   */
  func configureCell(path: IndexPath, object: Item) {
    self.path = path
    self.object = object
    self.updateOutlets()
  }
  
  /**
   * Update Outlets
   */
  func updateOutlets() {
    if let object = self.object {
      self.idLabel?.text = "\(object.id)"
      self.nameLabel?.text = object.name
    }
  } // ./updateOutlets
  
  // MARK: - UITableViewCell
  
  /**
   * Awake From Nib
   */
  override func awakeFromNib() {
    super.awakeFromNib()
  } // ./awakeFromNib
  
  /**
   * Set Selected
   * - parameter: Bool (selected)
   * - parameter: Bool (animated)
   */
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  } // ./setSelected
  
} // ./ItemCell
