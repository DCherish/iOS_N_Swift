//
//  FeedTableViewCell.swift
//  Tweet
//
//  Created by kid cherish on 2022/07/12.
//

import SnapKit
import UIKit

final class FeedTableViewCell: UITableViewCell {
    static let identifier = "FeedTableViewCell"
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 20.0
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.like.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.message.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.share.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    func setup(tweet: Tweet) {
        self.selectionStyle = .none
        
        setupLayout()
        
        nameLabel.text = tweet.user.name
        accountLabel.text = "@\(tweet.user.account)"
        contentsLabel.text = tweet.contents
    }
}

private extension FeedTableViewCell {
    func setupLayout() {
        let buttonStackView = UIStackView(
            arrangedSubviews: [likeButton, commentButton, shareButton]
        )
        
        buttonStackView.distribution = .fillEqually
        
        [
            profileImageView,
            nameLabel,
            accountLabel,
            contentsLabel,
            buttonStackView
        ]
            .forEach { self.addSubview($0) }
        
        let superViewInset: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(superViewInset)
            $0.top.equalToSuperview().offset(superViewInset)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(superViewInset)
            $0.top.equalTo(profileImageView.snp.top)
        }
        
        accountLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(superViewInset)
            $0.bottom.equalTo(nameLabel.snp.bottom)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.top.equalTo(nameLabel.snp.bottom).offset(4.0)
            $0.trailing.equalToSuperview().inset(superViewInset)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(contentsLabel.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(12.0)
            $0.bottom.equalToSuperview().inset(superViewInset)
        }
    }
}
