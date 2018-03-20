//
//  Item.swift
//  ios-master-detail
//
//  Created by Roderic Linguri on 3/20/18.
//  Copyright © 2018 Digices LLC. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
  
  // MARK: - Properties
  
  var id: Int
  
  var name: String
  
  // MARK: - App
  
  /**
   * Init With Dict
   * - parameter: [String:Any]
   */
  init(dict: [String:Any]) {
    
    if let idInt = dict["id"] as? Int {
      self.id = idInt
    } else {
      self.id = 0
    }
    
    if let nameStr = dict["name"] as? String {
      self.name = nameStr
    } else {
      self.name = ""
    }
    
  } // ./initWithDict
  
  // MARK: - NSObject
  
  /**
   * Init
   */
  override init() {
    self.id = 0
    self.name = ""
    super.init()
  }
  
  // MARK: - NSCoding
  
  /**
   * Encode With Coder
   * - parameter: NSCoder
   */
  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.id, forKey: Key.id)
    aCoder.encode(self.name, forKey: Key.name)
  }
  
  /**
   * Init With Coder
   * - parameter: NSCoder
   */
  required init?(coder aDecoder: NSCoder) {
    self.id = aDecoder.decodeInteger(forKey: Key.id)
    self.name = aDecoder.decodeObject(forKey: Key.name) as! String
    super.init()
  }

} // ./Item
