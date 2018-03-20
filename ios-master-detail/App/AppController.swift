//
//  AppController.swift
//  ios-template
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class AppController: UIViewController {
  
  // MARK: - Properties

  let manager: AppManager = AppManager.shared
  
  // MARK: - Outlets

  @IBOutlet weak var viewContainer: UIView!
  
  // MARK: - Actions

  // MARK: - AppController

  // MARK: - UIViewController

  /**
   * Awake From Nib
   */
  override func awakeFromNib() {
    super.awakeFromNib()
  } // ./awakeFromNib
  
  /**
   * View Did Load
   */
  override func viewDidLoad() {
    super.viewDidLoad()
  } // ./viewDidLoad
  
} // ./AppController
