//
//  LoginViewController.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/03/01.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class SignViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupUI()
        setupConstraints()
        setupRx()
    }
    
    // MARK: - Rx Code
    func setupRx() {
        SingInButton.rx.tap
            .map({ _ in TabBarController()})
            .subscribe(onNext: { [weak self] VC in
                VC.modalPresentationStyle = .fullScreen
                self?.present(VC, animated: true)
            })
            .disposed(by: disposeBag)
    }
        
    // MARK: - Setup UI
    let imageView = UIImageView().then {
        $0.image = UIImage(named: "IMG_1622")
    }
    
    let SingInButton = UIButton().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 4
        $0.setTitle(" Sign in with Apple", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    func setupUI() {
        self.view.backgroundColor = .black
        self.view.addSubview(imageView)
        self.view.addSubview(SingInButton)
    }
    
    // MARK: - Setup Constraints
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(300)
        }
        SingInButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(40)
        }
    }
}
