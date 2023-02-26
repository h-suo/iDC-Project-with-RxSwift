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
    
    func setupTabBar() {
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    func setupTabBarItem() {
        let firstVC = UINavigationController(rootViewController: ViewController())
        firstVC.tabBarItem.selectedImage = UIImage(systemName: "house")
        firstVC.tabBarItem.image = UIImage(systemName: "house.fill")
        firstVC.tabBarItem.title = "home"
        
        let secondVC = UINavigationController(rootViewController: MessageViewController())
        secondVC.view.backgroundColor = .black
        secondVC.tabBarItem.image = UIImage(systemName: "message")
        secondVC.tabBarItem.title = "message"
        
        viewControllers = [firstVC, secondVC]
    }
}
