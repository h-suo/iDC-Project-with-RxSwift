//
//  LoginViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/03/01.
//

import UIKit
import Then
import SnapKit

class SignViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupUI()
        setupConstraints()
        LoginButton.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - RX Code
    func setupRX() {
        
    }
    
    // MARK: - Setup Code
    @IBAction func pressButton(_ sender: UIBarButtonItem) {
        let addView = AddPostViewController()
        self.navigationController?.pushViewController(addView, animated: true)
    }
    
    @objc func singInButtonTapped(_ sender: UIButton) {
        let tapBarVC = TabBarController()
        tapBarVC.modalPresentationStyle = .fullScreen
        
        self.present(tapBarVC, animated: true)
    }
    
    // MARK: - Setup UI
    let imageView = UIImageView().then {
        $0.image = UIImage(named: "IMG_1622")
    }
    
    let LoginButton = UIButton().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 4
        $0.setTitle(" Sign in with Apple", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    func setupUI() {
        self.view.backgroundColor = .black
        self.view.addSubview(imageView)
        self.view.addSubview(LoginButton)
    }
    
    // MARK: - Setup Constraints
    func setupConstraints() {
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
