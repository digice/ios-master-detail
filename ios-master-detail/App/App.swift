//
//  App.swift
//  ios-template
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class App: NSObject, NSCoding {
  
  // MARK: - Properties

  // MARK: - App

  // MARK: - NSObject
  
  /**
   * Init
   */
  override init() {
    super.init()
  }
  
  // MARK: - NSCoding

  /**
   * Encode With Coder
   * - parameter: NSCoder
   */
  func encode(with aCoder: NSCoder) {
    //
  }
  
  /**
   * Init With Coder
   * - parameter: NSCoder
   */
  required init?(coder aDecoder: NSCoder) {
    super.init()
  }
  
} // ./App
