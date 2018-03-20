//
//  ItemManager.swift
//  ios-master-detail
//
//  Created by Roderic Linguri on 3/20/18.
//  Copyright © 2018 Digices LLC. All rights reserved.
//

import UIKit

class ItemManager {
  
  // MARK: - Properties
  
  static let shared: ItemManager = ItemManager()
  
  var master: ItemManagerDelegate?
  
  var detail: ItemManagerDelegate?
  
  var objects: [Item]
  
  var index: [[Int]] = [[]]
  
  var selected: Int? {
    didSet {
      if self.selected != nil {
        self.master?.itemManagerDidSelectItem()
        self.detail?.itemManagerDidSelectItem()
      }
    }
  }
  
  // MARK: - ItemManager
  
  /**
   * Init
   */
  private init() {
    if let storedData = UserDefaults.standard.data(forKey: Key.items) {
      if let storedObjects = NSKeyedUnarchiver.unarchiveObject(with: storedData) as? [Item] {
        self.objects = storedObjects
      } else {
        self.objects = []
      }
    } else {
      self.objects = []
    }
    self.generateIndex()
  } // ./init
  
  /**
   * Generate Index
   */
  func generateIndex() {
    self.index = [[]]
    var i: Int = 0
    for _ in self.objects {
      self.index[0].append(i)
      i += 1
    }
    self.master?.itemManagerDidUpdateItems()
  } // ./generateIndex
  
} // ./ItemManager
