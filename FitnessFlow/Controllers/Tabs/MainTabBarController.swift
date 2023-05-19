//
//  MainTabBarController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create instances of the view controllers for each tab
        let homeVC = HomeViewController()
        let workoutsVC = WorkoutsViewController()
        let progressVC = ProgressViewController()
//        let nutritionVC = NutritionViewController()
        let profileVC = ProfileViewController()
        
        // Set the view controllers for each tab
        self.setViewControllers([homeVC, workoutsVC, progressVC, profileVC], animated: false)
        
        // Resize images
        func resizeImage(named name: String, to size: CGSize) -> UIImage? {
            guard let originalImage = UIImage(named: name) else { return nil }
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            originalImage.draw(in: CGRect(origin: .zero, size: size))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return resizedImage?.withRenderingMode(.alwaysOriginal)
        }

        // Customize the tab bar item for each tab
        let homeImageSize = CGSize(width: 24, height: 24)
        let workoutsImageSize = CGSize(width: 24, height: 24)
        let progressImageSize = CGSize(width: 24, height: 24)
//        let nutritionImageSize = CGSize(width: 24, height: 24)
        let profileImageSize = CGSize(width: 24, height: 24)

        homeVC.tabBarItem = UITabBarItem(title: "Home", image: resizeImage(named: "home_u", to: homeImageSize), selectedImage: resizeImage(named: "home_s", to: homeImageSize))
        workoutsVC.tabBarItem = UITabBarItem(title: "Workouts", image: resizeImage(named: "workouts_u", to: workoutsImageSize), selectedImage: resizeImage(named: "workouts_s", to: workoutsImageSize))
        progressVC.tabBarItem = UITabBarItem(title: "Progress", image: resizeImage(named: "progress_u", to: progressImageSize), selectedImage: resizeImage(named: "progress_s", to: progressImageSize))
//        nutritionVC.tabBarItem = UITabBarItem(title: "Nutrition", image: resizeImage(named: "nutrition_u", to: nutritionImageSize), selectedImage: resizeImage(named: "nutrition_s", to: nutritionImageSize))
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: resizeImage(named: "profile_u", to: profileImageSize), selectedImage: resizeImage(named: "profile_s", to: profileImageSize))
        
        // Customize the appearance of the tab bar
        let selectedColor = AppThemeData.colorIconSelected
        let unselectedColor = AppThemeData.colorIconUnselected
        
        UITabBar.appearance().tintColor = selectedColor
        UITabBar.appearance().unselectedItemTintColor = unselectedColor
        
        let attributes = [NSAttributedString.Key.font: AppThemeData.fontSizeCaption1]
        UITabBarItem.appearance().setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
    }
    
}

