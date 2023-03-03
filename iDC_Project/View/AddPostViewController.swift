//
//  AddPostViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import UIKit
import SnapKit
import RxSwift

class AddPostViewController: UIViewController, UITextViewDelegate {
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        viewModel = HomeViewModel.shared
        
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
        let rightButton = UIBarButtonItem(title: "write", style: .plain, target: self, action: #selector(writeButtonTapped))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @IBAction func writeButtonTapped(_ sender: UIBarButtonItem) {
        let title = titleTextField.text ?? "제목"
        let description = textView.text ?? "내용"
        let time = "\(Date())"
        viewModel?.writePost(title: title, description: description, time: time)
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup UIKit
    let titleTextField: UITextField = {
        let ttf = UITextField()
        ttf.borderStyle = .roundedRect
        ttf.placeholder = "title"
        ttf.backgroundColor = .systemFill
        ttf.font = .systemFont(ofSize: 20)
        
        return ttf
    }()
    
    let textView: UITextView = {
        let tf = UITextView()
        tf.backgroundColor = .systemFill
        tf.font = .systemFont(ofSize: 18)
        tf.text = "Please enter your content."
        tf.textColor = .systemGray2
        tf.layer.cornerRadius = 4
        
        return tf
    }()
    
    let textCountLabel: UILabel = {
        let dl = UILabel()
        dl.font = UIFont.systemFont(ofSize: 14)
        dl.textColor = .gray
        dl.textAlignment = .right
        dl.text = "(0/1000)"
        
        return dl
    }()
    
    // MARK: - Setup TextView
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Please enter your content." {
            textView.text = nil
            textView.textColor = .white
            textView.becomeFirstResponder()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringeRange = Range(range, in: currentText) else { return false }
        
        let changeText = currentText.replacingCharacters(in: stringeRange, with: text)
        
        textCountLabel.text = "(\(changeText.count)/1000)"
        return changeText.count <= 999
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Setup View
    func setupView() {
        self.view.backgroundColor = .black
        self.view.addSubview(titleTextField)
        self.view.addSubview(textView)
        self.view.addSubview(textCountLabel)
        
        setConstraints()
    }
    
    // MARK: - Setup Constraints
    func setConstraints() {
        titleTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        textView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.height.equalTo(300)
        }
        textCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(textView).offset(-12)
            make.bottom.equalTo(textView).offset(-12)
            make.width.equalTo(80)
        }
    }
}
