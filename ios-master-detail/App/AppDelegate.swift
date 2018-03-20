//
//  AppDelegate.swift
//  ios-template
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: - Properties
  
  var window: UIWindow?
  
  // MARK: - AppDelegate methods
  
  /**
   * Did Finish Launching With Options
   * - parameter: UIApplication
   * - parameter: [String:Any]
   * - return:    Bool
   */
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    return true
  } // ./applicationDidFinishLaunchingWithOptions
  
  /**
   * Will Resign Active
   * - parameter: UIApplication
   */
  func applicationWillResignActive(_ application: UIApplication) {
    
  } // ./applicationWillResignActive
  
  /**
   * Will Did Enter Background
   * - parameter: UIApplication
   */
  func applicationDidEnterBackground(_ application: UIApplication) {
    
  } // ./applicationDidEnterBackground
  
  /**
   * Will Enter Foreground
   * - parameter: UIApplication
   */
  func applicationWillEnterForeground(_ application: UIApplication) {
    
  } // ./applicationWillEnterForeground
  
  /**
   * Will Did Become Active
   * - parameter: UIApplication
   */
  func applicationDidBecomeActive(_ application: UIApplication) {
    
  } // ./applicationDidBecomeActive
  
  /**
   * Will Terminate
   * - parameter: UIApplication
   */
  func applicationWillTerminate(_ application: UIApplication) {
    
  } // ./applicationWillTerminate
  
} // ./AppDelegate
