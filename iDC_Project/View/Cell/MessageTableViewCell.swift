//
//  MessageTableViewCell.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import UIKit
import SnapKit

class MessageTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // MARK: - Setup UI
    let nameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .white
        $0.numberOfLines = 1
    }
    
    let messageLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .systemFill
        $0.numberOfLines = 1
    }
    
    let timeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .systemFill
    }
    
    func setupUI() {
        
        self.addSubview(nameLabel)
        self.addSubview(messageLabel)
        self.addSubview(timeLabel)
    }
    
    // MARK: - Setup Constraints
    func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(4)
            make.width.equalTo(40)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
