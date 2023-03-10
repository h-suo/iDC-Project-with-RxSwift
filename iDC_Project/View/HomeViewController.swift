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
    
    var viewModel: PostViewModel?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = nil
        
        setupUI()
        setupNavigation()
        navigationItemSetting()
        setupRx()
    }
    
    // MARK: - Rx Code
    func setupRx() {
        viewModel = PostViewModel.shared
        
        viewModel?.postObservable
            .observe(on: MainScheduler.instance)
            .filter({ !$0.isEmpty })
            .bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: HomeTableViewCell.self)) { index, item, cell in
                cell.updateUI(item)
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(PostForm.self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] post in
                self?.presentDetail(of: post)
            })
            .disposed(by: disposeBag)
        
        navigationItem.rightBarButtonItem?.rx.tap
            .map({ _ in AddPostViewController()})
            .subscribe(onNext: { [weak self] VC in
                self?.navigationController?.pushViewController(VC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func presentDetail(of post: PostForm) {
        let detailVC = PostDetailiViewController()
        viewModel?.selectedPost = post
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - Setup UI
    func setupUI() {
        self.view.backgroundColor = .black
        self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.rowHeight = 80
    }
    
    // MARK: - Setup Navigation
    func setupNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.overrideUserInterfaceStyle = .dark
        self.navigationItem.title = "iDC"
    }
    
    func navigationItemSetting() {
        let rightButtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItems = [rightButtn, searchButton]
        self.navigationItem.backBarButtonItem = backButton
    }
}

