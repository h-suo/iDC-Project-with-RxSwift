//
//  AddPostViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class AddPostViewController: UIViewController, UITextViewDelegate {
    
    var viewModel: PostViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        viewModel = PostViewModel.shared
        
        setupNavigation()
        navigationItemSetting()
        setupUI()
        setupConstraints()
        setupRx()
    }
    
    // MARK: - Rx Code
    func setupRx() {
        navigationItem.rightBarButtonItem?.rx.tap
            .subscribe(onNext: {
                self.presentAddPost()
            })
            .disposed(by: disposeBag)
    }
    
    func presentAddPost() {
        let title = self.titleTextField.text ?? "제목"
        let description = self.textView.text ?? "내용"
        let time = "\(Date())"
        viewModel?.writePost(title: title, description: description, time: time)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup Navigation
    func setupNavigation() {
        self.navigationItem.title = "Add Post"
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.overrideUserInterfaceStyle = .dark
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func navigationItemSetting() {
        let rightButton = UIBarButtonItem(title: "write", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
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
    
    // MARK: - Setup UI
    let titleTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.placeholder = "title"
        $0.backgroundColor = .systemFill
        $0.font = .systemFont(ofSize: 20)
    }
    
    let textView = UITextView().then {
        $0.backgroundColor = .systemFill
        $0.font = .systemFont(ofSize: 18)
        $0.text = "Please enter your content."
        $0.textColor = .systemGray2
        $0.layer.cornerRadius = 4
    }
    
    let textCountLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .gray
        $0.textAlignment = .right
        $0.text = "(0/1000)"
    }
    
    func setupUI() {
        self.view.backgroundColor = .black
        self.view.addSubview(titleTextField)
        self.view.addSubview(textView)
        self.view.addSubview(textCountLabel)
    }
    
    // MARK: - Setup Constraints
    func setupConstraints() {
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
