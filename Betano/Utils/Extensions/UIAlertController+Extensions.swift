//
//  UIAlertController+Extensions.swift
//  Betano
//
//  Created by Yuri on 07/04/2022.
//

import UIKit

extension UIAlertController {

    static func showAlertDialog(title: String, message: String, handler: ((UIAlertAction) -> ())? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler ?? nil)
        alert.addAction(okAction)
        return alert
    }
}
