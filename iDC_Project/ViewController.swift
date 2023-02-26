//
//  ViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/23.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        setupNavigation()
        navigationItemSetting()
    }
    
    func setupNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.overrideUserInterfaceStyle = .dark
        self.navigationItem.title = "iDC"
    }
    
    func navigationItemSetting() {
        let rightButtn = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(pressButton(_:)))
        self.navigationItem.rightBarButtonItem = rightButtn
    }
    
    @IBAction func pressButton(_ sender: UIBarButtonItem) {
        let settingView = UIViewController()
        settingView.view.backgroundColor = .black
        self.navigationController?.pushViewController(settingView, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        return
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

