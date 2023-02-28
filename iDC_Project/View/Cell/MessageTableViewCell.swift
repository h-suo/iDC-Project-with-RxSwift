//
//  MessageTableViewCell.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    // - MARK: Setup UIKit
    let nameLabel: UILabel = {
        let nl = UILabel()
        nl.font = UIFont.systemFont(ofSize: 18)
        nl.textColor = .white
        nl.numberOfLines = 1
        
        return nl
    }()
    
    let messageLabel: UILabel = {
        let ml = UILabel()
        ml.font = UIFont.systemFont(ofSize: 18)
        ml.textColor = .systemFill
        ml.numberOfLines = 1
        
        return ml
    }()
    
    let timeLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 14)
        tl.textColor = .systemFill
        
        return tl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    // - MARK: Setup View
    func setupView() {
        
        self.addSubview(nameLabel)
        self.addSubview(messageLabel)
        self.addSubview(timeLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // - MARK: Setup Constraints
    func setConstraints() {
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(4)
            make.width.equalTo(40)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(12)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-12)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
