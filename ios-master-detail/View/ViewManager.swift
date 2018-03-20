//
//  ViewManager.swift
//  ios-template
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class ViewManager {
  
  // MARK: - Properties

  static let shared: ViewManager = ViewManager()
  
  var view: ViewController?
  
  var items: ItemsController?
  
  var item: ItemController?
  
  // MARK: - ViewManager

  /**
   * Init
   */
  private init() {
    
  } // ./init
  
} // ./ViewManager
