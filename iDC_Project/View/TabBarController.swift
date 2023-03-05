//
//  TabBarController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/26.
//

import UIKit
import RxSwift
import RxCocoa

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTabBarItem()
    }
    
    // MARK: - Setup TapBar
    func setupTabBar() {
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    func setupTabBarItem() {
        
        let firstVC = UINavigationController(rootViewController: HomeViewController())
        firstVC.tabBarItem.image = UIImage(systemName: "house")
        firstVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        firstVC.tabBarItem.title = "home"
        
        let secondVC = UINavigationController(rootViewController: MessageViewController())
        secondVC.tabBarItem.image = UIImage(systemName: "message")
        secondVC.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        secondVC.tabBarItem.title = "message"
        
        let thirdVC = UINavigationController(rootViewController: AlarmViewController())
        thirdVC.tabBarItem.image = UIImage(systemName: "bell")
        thirdVC.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        thirdVC.tabBarItem.title = "alarm"
        
        let fourthVC = UINavigationController(rootViewController: SettingViewController())
        fourthVC.tabBarItem.image = UIImage(systemName: "gearshape")
        fourthVC.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        fourthVC.tabBarItem.title = "setting"
        
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
}
