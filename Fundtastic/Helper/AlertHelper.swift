//
//  AlertHelper.swift
//  Fundtastic
//
//  Created by Kendra Arsena W on 21/01/22.
//

import UIKit

extension UIAlertController {
    
    class func showOKAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        return alert
    }
    
}

