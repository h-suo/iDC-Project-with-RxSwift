//
//  PostDetailiViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/03/03.
//

import UIKit

class PostDetailiViewController: UIViewController {

    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewModel = HomeViewModel.shared
        
        setupNavigation()
        setupUI()
        setupView()
    }
    
    // MARK: - Setup Code
    func setupNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.overrideUserInterfaceStyle = .dark
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func setupUI() {
        let post = viewModel?.selectedPost
        titleLabel.text = post?.title
        tiemLabel.text = post?.time
        textView.text = post?.description
    }
    
    // MARK: - Setup UIKit
    let titleLabel: UILabel = {
        let tl = UILabel()
        tl.font = .systemFont(ofSize: 20)

        return tl
    }()
    
    let tiemLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 14)
        tl.textColor = .gray
        
        return tl
    }()

    let textView: UITextView = {
        let tf = UITextView()
//        tf.backgroundColor = .systemFill
        tf.font = .systemFont(ofSize: 18)
        tf.textColor = .lightGray
        tf.isEditable = false
        
        return tf
    }()

    // MARK: - Setup View
    func setupView() {
        self.view.backgroundColor = .black
        self.view.addSubview(titleLabel)
        self.view.addSubview(tiemLabel)
        self.view.addSubview(textView)

        setConstraints()
    }

    // MARK: - Setup Constraints
    func setConstraints() {
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
