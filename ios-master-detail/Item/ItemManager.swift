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
  
  var objects: [Item] = []
  
  var index: [[Int]] = [[]]
  
  var selected: Int? {
    didSet {
      self.master?.itemManagerDidSelectItem()
      self.detail?.itemManagerDidSelectItem()
    }
  }
  
  private init() {
    // temp create objects
    let item1 = Item(dict: ["id":1,"name":"First Item"])
    self.objects.append(item1)
    let item2 = Item(dict: ["id":2,"name":"Second Item"])
    self.objects.append(item2)
    let item3 = Item(dict: ["id":3,"name":"Third Item"])
    self.objects.append(item3)
    self.generateIndex()
  }
  
  func generateIndex() {
    self.index = [[]]
    var i: Int = 0
    for _ in self.objects {
      self.index[0].append(i)
      i += 1
    }
    self.master?.itemManagerDidUpdateItems()
  }
  
} // ./ItemManager
