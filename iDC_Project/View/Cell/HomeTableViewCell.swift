//
//  HomeTableViewCell.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import UIKit
import SnapKit
import Then

class HomeTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - update UI
    func updateUI(_ posts: PostForm) {
        self.titleLabel.text = posts.title
        self.descriptionLabel.text = posts.description
        self.timeLabel.text = posts.time
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // MARK: - Setup UI
    let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .white
        $0.numberOfLines = 1
    }
    
    let descriptionLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .gray
        $0.numberOfLines = 1
    }
    
    let timeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    func setupUI() {
        self.backgroundColor = .black
        
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(timeLabel)
    }
    
    // MARK: - Setup Constraints
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-4)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(20)
        }
    }
}
