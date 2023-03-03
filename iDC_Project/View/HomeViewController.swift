//
//  ViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UITableViewController {
    
    let cellId = "HomeTableViewCell"
    
    var viewModel: HomeViewModel?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = nil
        
        setupUi()
        setupNavigation()
        navigationItemSetting()
        setupRX()
    }
    
    // MARK: - RX Code
    func setupRX() {
        viewModel = HomeViewModel.shared
        
        viewModel?.postObservable
            .bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: HomeTableViewCell.self)) { index, item, cell in

                cell.titleLabel.text = item.title
                cell.descriptionLabel.text = item.description
                cell.timeLabel.text = item.time
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(PostForm.self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] post in
                self?.presentDetail(of: post)
            })
            .disposed(by: disposeBag)
    }
    
    func presentDetail(of post: PostForm) {
        let detailVC = PostDetailiViewController()
        viewModel?.selectedPost = post
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - Setup Code
    func setupUi() {
        self.view.backgroundColor = .black
        self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.rowHeight = 80
    }
    
    func setupNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.overrideUserInterfaceStyle = .dark
        self.navigationItem.title = "iDC"
    }
    
    func navigationItemSetting() {
        let rightButtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(pressButton(_:)))
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItems = [rightButtn, searchButton]
        self.navigationItem.backBarButtonItem = backButton
    }
    
    @IBAction func pressButton(_ sender: UIBarButtonItem) {
        let addView = AddPostViewController()
        self.navigationController?.pushViewController(addView, animated: true)
    }
}

