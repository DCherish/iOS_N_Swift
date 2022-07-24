//
//  RepositoryListCell.swift
//  GitHubRepository
//
//  Created by kid cherish on 2022/06/13.
//

import UIKit
import SnapKit

class RepositoryListCell: UITableViewCell {
    var repository: Repository?
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let starImageView = UIImageView()
    let starLabel = UILabel()
    let languageLabel = UILabel()
    
    func setup() {
        [
            nameLabel,
            descriptionLabel,
            starImageView,
            starLabel,
            languageLabel
        ].forEach {
            addSubview($0)
        }
        
        guard let repository = repository else { return }

        nameLabel.text = repository.name
        nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
//        nameLabel.setContentHuggingPriority(.required, for: .vertical)

        descriptionLabel.text = repository.description
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 2
        
        starImageView.image = UIImage(systemName: "star")
        
        starLabel.text = "\(repository.stargazersCount)"
        starLabel.font = .systemFont(ofSize: 16)
        starLabel.textColor = .gray
        
        languageLabel.text = repository.language
        languageLabel.font = .systemFont(ofSize: 16)
        languageLabel.textColor = .gray
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().inset(12)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(nameLabel)
        }
        
        starImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.leading.equalTo(descriptionLabel)
            $0.width.height.equalTo(20)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        starLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImageView)
            $0.leading.equalTo(starImageView.snp.trailing).offset(4)
        }
        
        languageLabel.snp.makeConstraints {
            $0.centerY.equalTo(starLabel)
            $0.leading.equalTo(starLabel.snp.trailing).offset(12)
        }
    }
}
