//
//  LoginViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/03/01.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupView()
        LoginButton.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
    }
    
    @objc func singInButtonTapped(_ sender: UIButton) {
        let tapBarVC = TabBarController()
        tapBarVC.modalPresentationStyle = .fullScreen
        
        self.present(tapBarVC, animated: true)
    }
    
    // MARK: - RX Code
    func setupRX() {
        
    }
    
    // MARK: - Setup Code
    @IBAction func pressButton(_ sender: UIBarButtonItem) {
        let addView = AddPostViewController()
        self.navigationController?.pushViewController(addView, animated: true)
    }
    
    // MARK: - Setup UIKit
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "IMG_1622")
        
        return iv
    }()
    
    let LoginButton: UIButton = {
        let lb = UIButton(type: .roundedRect)
        lb.backgroundColor = .white
        lb.layer.cornerRadius = 4
        lb.setTitle(" Sign in with Apple", for: .normal)
        lb.setTitleColor(.black, for: .normal)
        
        return lb
    }()
    
    // MARK: - Setup View
    func setupView() {
        self.view.backgroundColor = .black
        self.view.addSubview(imageView)
        self.view.addSubview(LoginButton)
        
        setConstraints()
    }
    
    // MARK: - Setup Constraints
    func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(300)
        }
        LoginButton.snp.makeConstraints { make in
            make.width.equalTo(168)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(40)
        }
    }
}
