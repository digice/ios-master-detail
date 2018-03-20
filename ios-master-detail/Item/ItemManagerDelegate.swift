//
//  ItemManagerDelegate.swift
//  ios-master-detail
//
//  Created by Roderic Linguri on 3/20/18.
//  Copyright © 2018 Digices LLC. All rights reserved.
//

import UIKit

protocol ItemManagerDelegate {
  func itemManagerDidUpdateItems()
  func itemManagerDidSelectItem()
}
