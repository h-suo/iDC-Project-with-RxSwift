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
    
    let textCountLabel: UILabel = {
        let dl = UILabel()
        dl.font = UIFont.systemFont(ofSize: 14)
        dl.textColor = .gray
        dl.textAlignment = .right
        dl.text = "(0/1000)"
        
        return dl
    }()
    
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
    
    // - MARK: Setup View
    func setupView() {
        self.view.backgroundColor = .black
        self.view.addSubview(textView)
        self.view.addSubview(textCountLabel)
        
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
        textCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(textView).offset(-12)
            make.bottom.equalTo(textView).offset(-12)
            make.width.equalTo(80)
        }
    }
}
