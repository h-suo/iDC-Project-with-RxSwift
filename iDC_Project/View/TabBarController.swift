//
//  TabBarController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/26.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTabBarItem()
    }
    
    // MARK: - Setup Code
    func setupTabBar() {
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    func setupTabBarItem() {
        let firstVC = UINavigationController(rootViewController: HomeViewController())
        firstVC.tabBarItem.selectedImage = UIImage(systemName: "house")
        firstVC.tabBarItem.image = UIImage(systemName: "house.fill")
        firstVC.tabBarItem.title = "home"
        
        let secondVC = UINavigationController(rootViewController: MessageViewController())
        secondVC.view.backgroundColor = .black
        secondVC.tabBarItem.image = UIImage(systemName: "message")
        secondVC.tabBarItem.title = "message"
        
        let thirdVC = UINavigationController(rootViewController: AlarmViewController())
        thirdVC.view.backgroundColor = .black
        thirdVC.tabBarItem.image = UIImage(systemName: "bell.fill")
        thirdVC.tabBarItem.title = "alarm"
        
        let fourthVC = UINavigationController(rootViewController: SettingViewController())
        fourthVC.view.backgroundColor = .black
        fourthVC.tabBarItem.image = UIImage(systemName: "gearshape")
        fourthVC.tabBarItem.title = "setting"
        
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
}
