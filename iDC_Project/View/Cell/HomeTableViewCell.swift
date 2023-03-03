//
//  HomeTableViewCell.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Setup UI
    func updateUI(_ posts: PostForm) {
        self.titleLabel.text = posts.title
        self.descriptionLabel.text = posts.description
        self.timeLabel.text = posts.time
        self.selectionStyle = .none
    }
    
    // MARK: - Setup UIKit
    let titleLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 18)
        tl.textColor = .white
        tl.numberOfLines = 1
        
        return tl
    }()
    
    let descriptionLabel: UILabel = {
        let dl = UILabel()
        dl.font = UIFont.systemFont(ofSize: 14)
        dl.textColor = .gray
        dl.numberOfLines = 1
        
        return dl
    }()
    
    let timeLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 14)
        tl.textColor = .gray
        
        return tl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    // MARK: - Setup View
    func setupView() {
        self.backgroundColor = .black
        
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(timeLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Constraints
    func setConstraints() {
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
