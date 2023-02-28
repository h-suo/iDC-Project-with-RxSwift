//
//  SettingViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        setupNavigation()
    }
    
    // MARK: - Setup Code
    func setupNavigation() {
        self.navigationItem.title = "Setting"
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.overrideUserInterfaceStyle = .dark
    }
}
