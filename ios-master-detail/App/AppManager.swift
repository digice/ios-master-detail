//
//  AppManager.swift
//  ios-template
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class AppManager {
  
  // MARK: - Properties

  static let shared: AppManager = AppManager()
  
  var object: App

  // MARK: - AppManager

  /**
   * Init
   */
  private init() {
    if let storedData = UserDefaults.standard.data(forKey: Key.app) {
      if let storedObject = NSKeyedUnarchiver.unarchiveObject(with: storedData) as? App {
        self.object = storedObject
      } else {
        self.object = App()
      }
    } else {
      self.object = App()
    }
  } // ./init

  /**
   * Save
   */
  func save() {
    let dataToStore = NSKeyedArchiver.archivedData(withRootObject: self.object)
    UserDefaults.standard.set(dataToStore, forKey: Key.app)
    UserDefaults.standard.synchronize()
  } // ./save
  
} // ./AppManager
