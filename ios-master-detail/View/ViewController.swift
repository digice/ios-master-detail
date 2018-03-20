//
//  ViewController.swift
//  ios-template
//
//  Created by Roderic Linguri <linguri@digices.com>
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties

  let manager: ViewManager = ViewManager.shared
  
  var keyboard: CGRect = CGRect.zero

  var keyboardIsVisible: Bool = false
  
  // MARK: - Outlets

  @IBOutlet weak var containerBottom: NSLayoutConstraint!
  
  // MARK: - Selectors

  /**
   * Notification Handler
   * - parameter: Notification
   */
  @objc func notificationHandler(_ notification: Notification) {
    if let userInfo = notification.userInfo {
      if let screenFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect {
        let viewFrame = self.view.convert(screenFrame, from: UIScreen.main.coordinateSpace)
        if viewFrame.minY != self.keyboard.minY {
          self.keyboard = viewFrame
          let offset: CGFloat = self.view.bounds.height - viewFrame.minY
          if offset > 0 {
            self.keyboardIsVisible = true
          } else {
            self.keyboardIsVisible = false
          }
          self.containerBottom.constant = offset
          UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
          } // ./animate
        } // ./new frame is different than stored frame
      } // ./frame in userInfo
    } // ./have userInfo
  } // ./notificationHandler
  
  /**
   * Awake From Nib
   */
  override func awakeFromNib() {
    super.awakeFromNib()
    self.manager.view = self
  } // ./awakeFromNib
  
  /**
   * View Did Load
   */
  override func viewDidLoad() {
    super.viewDidLoad()
  } // ./viewDidLoad
  
  /**
   * View Will Appear
   * - parameter: Bool (animated)
   */
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(ViewController.notificationHandler(_:)),
      name: .UIKeyboardWillChangeFrame, object: nil)
  } // ./viewWillAppear
  
  /**
   * View Did Disappear
   * - parameter: Bool (animated)
   */
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    NotificationCenter.default.removeObserver(self)
  } // ./viewDidDisappear
  
} // ./ViewController
