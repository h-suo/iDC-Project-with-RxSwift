//
//  AddPostViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import UIKit

class AddPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        setupNavigation()
    }
    
    // MARK: - Setup Code
    func setupNavigation() {
        self.navigationItem.title = "Add Post"
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.overrideUserInterfaceStyle = .dark
        self.navigationItem.largeTitleDisplayMode = .never
    }
}
