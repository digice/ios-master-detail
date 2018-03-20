//
//  ItemController.swift
//  ios-master-detail
//
//  Created by Roderic Linguri on 3/20/18.
//  Copyright © 2018 Digices LLC. All rights reserved.
//

import UIKit

class ItemController: UIViewController, ItemManagerDelegate {
  
  // MARK: - Properties
  
  let manager: ItemManager = ItemManager.shared
  
  // MARK: - Outlets
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  @IBOutlet weak var contentView: UIView!
  
  @IBOutlet weak var idField: UITextField!
  
  @IBOutlet weak var nameField: UITextField!
  
  @IBOutlet weak var saveButton: UIButton!
  
  // MARK: - Actions

  @IBAction func didTouchSaveButton(_ sender: UIButton) {
    self.updateDataFromView()
    self.performSegue(withIdentifier: Identifier.itemsDismissItem, sender: nil)
  }
  
  // MARK: - ItemController
  
  func updateOutlets() {
    if let selected = self.manager.selected {
      let object = self.manager.objects[selected]
      self.idField?.text = "\(object.id)"
      self.nameField?.text = object.name
    }
  } // ./updateOutlets
  
  /**
   * Update Data From View
   */
  func updateDataFromView() {
    
    if let selected = self.manager.selected {
      
      if let idText = self.idField?.text {
        if let id = Int(idText) {
          self.manager.objects[selected].id = id
        }
      }
      
      if let name = self.nameField?.text {
        self.manager.objects[selected].name = name
      }
      
      let object = self.manager.objects[selected]
      self.idField?.text = "\(object.id)"
      self.nameField?.text = object.name
      
    }

  } // ./updateDataFromView
  
  // MARK: - UIViewController
  
  /**
   * Awake From Nib
   */
  override func awakeFromNib() {
    super.awakeFromNib()
    ViewManager.shared.item = self
    self.manager.detail = self
  }
  
  /**
   * View Did Load
   */
  override func viewDidLoad() {
    super.viewDidLoad()
    self.updateOutlets()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.manager.generateIndex()
  }
  
  // MARK: - ItemManagerDelegate
  
  /**
   * Did Update Items
   */
  func itemManagerDidUpdateItems() {
    //
  } // ./didUpdateItem
  
  /**
   * Did Select Item
   */
  func itemManagerDidSelectItem() {
    self.updateOutlets()
  } // ./didSelectItem
  
} // ./ItemController
