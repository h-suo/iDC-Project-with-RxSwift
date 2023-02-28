//
//  AddPostViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import UIKit
import SnapKit

class AddPostViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        setupNavigation()
        navigationItemSetting()
        setupView()
    }
    
    // MARK: - Setup Code
    func setupNavigation() {
        self.navigationItem.title = "Add Post"
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.overrideUserInterfaceStyle = .dark
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func navigationItemSetting() {
        let rightButton = UIBarButtonItem(title: "write", style: .plain, target: self, action: #selector(pressButton(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @IBAction func pressButton(_ sender: UIBarButtonItem) {
        
    }
    
    // - MARK: Setup UIKit
    let textView: UITextView = {
        let tf = UITextView()
        tf.backgroundColor = .systemFill
        tf.font = .systemFont(ofSize: 18)
        tf.text = "Please enter your content."
        tf.textColor = .gray
        tf.layer.cornerRadius = 4
        
        return tf
    }()
    
    let descriptionLabel: UILabel = {
        let dl = UILabel()
        dl.font = UIFont.systemFont(ofSize: 14)
        dl.textColor = .gray
        dl.numberOfLines = 1
        
        return dl
    }()
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Please enter your content." {
            textView.text = nil
            textView.textColor = .white
        }
    }
    
    // - MARK: Setup View
    func setupView() {
        self.view.backgroundColor = .black
        self.view.addSubview(textView)
        
        setConstraints()
    }
    
    // - MARK: Setup Constraints
    func setConstraints() {
        textView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(300)
        }
    }
}
