//
//  NotificationManager.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-29.
//

import Foundation
import UserNotifications
import UIKit

class NotificationManager {
    
    func requestNotificationPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                    if settings.authorizationStatus == .authorized {
                        DispatchQueue.main.async {
                            UIApplication.shared.registerForRemoteNotifications()
                            completion(true)
                        }
                    }
                }
            } else {
                completion(false)
            }
        }
    }
    
    func showNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Fitness Flow"
        content.body = "Button pressed! Notification shown."
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error showing notification: \(error.localizedDescription)")
            } else {
                print("Notification request successful")
            }
        }

    }
}
