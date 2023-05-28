//
//  AlertDialogWrapper.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-28.
//

import UIKit

public class AlertDialogWrapper {
    public func showErrorAlert(viewController: UIViewController, error: String, message: String) {
        let alertController = UIAlertController(title: error, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(AppThemeData.colorPrimary, forKey: "titleTextColor")
        
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}

