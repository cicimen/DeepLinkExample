//
//  Helper.swift
//  DeepLinkExample
//
//  Created by Egemen on 20.07.2020.
//  Copyright © 2020 Egemen. All rights reserved.
//

import UIKit

class Helper {
    
    class func openUrl(scheme: String) {
      if let url = URL(string: scheme) {
         if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:],
              completionHandler: {
                  (success) in
                     print("Open \(scheme): \(success)")
              })
        } else {
            let success = UIApplication.shared.openURL(url)
            print("Open \(scheme): \(success)")
        }
      }
    }
    
}
