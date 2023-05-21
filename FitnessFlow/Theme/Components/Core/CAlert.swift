//
//  CAlert.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import Foundation
import UIKit

class CAlert {
    static func showAlert(on viewController: UIViewController, title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: completion)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
