//
//  PostDetailiViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/03/03.
//

import UIKit

class PostDetailiViewController: UIViewController {

    var viewModel: PostViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewModel = PostViewModel.shared
        
        setupNavigation()
        updateData()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Setup Navigation
    func setupNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.overrideUserInterfaceStyle = .dark
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Rx Code
    func updateData() {
        let post = viewModel?.selectedPost
        titleLabel.text = post?.title
        tiemLabel.text = post?.time
        textView.text = post?.description
    }
    
    // MARK: - Setup UI
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
    }
    
    let tiemLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .gray
    }

    let textView = UITextView().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .lightGray
        $0.isEditable = false
    }

    func setupUI() {
        self.view.backgroundColor = .black
        self.view.addSubview(titleLabel)
        self.view.addSubview(tiemLabel)
        self.view.addSubview(textView)
    }

    // MARK: - Setup Constraints
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        tiemLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom)
        }
        textView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalTo(tiemLabel.snp.bottom).offset(12)
            make.height.equalTo(300)
        }
    }
}
