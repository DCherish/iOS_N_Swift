//
//  CreditCardCell.swift
//  CreditCardList
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit
import SnapKit
import Kingfisher

final class CreditCardCell: UITableViewCell {
    static let identifier = "CreditCardCell"
    
    private let stackView = UIStackView()
    
    private lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "creditcard.fill")
        
        return imageView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 3.0
        
        return stackView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    private lazy var rankLabel: UILabel = {
        let label = UILabel()
        label.text = "0위"
        label.font = .systemFont(ofSize: 17.0)
        label.textColor = .darkGray
        
        return label
    }()
    
    private lazy var benefitLabel: UILabel = {
        let label = UILabel()
        label.text = "0만원 증정"
        label.font = .systemFont(ofSize: 12.0, weight: .bold)
        label.textColor = .white
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "신용카드"
        label.font = .systemFont(ofSize: 19.0, weight: .bold)
        
        return label
    }()
    
    private lazy var buttonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        
        return imageView
    }()
    
    func setup(card: CreditCard) {
        setupLayout()
        
        rankLabel.text = "\(card.rank)위"
        benefitLabel.text = "\(card.promotionDetail.amount)만원 증정"
        nameLabel.text = "\(card.name)"
        
        let imageURL = URL(string: card.cardImageURL)
        cardImageView.kf.setImage(with: imageURL)
    }
}

extension CreditCardCell {
    func setupLayout() {
        [
            rankLabel,
            benefitLabel
        ]
            .forEach { labelStackView.addArrangedSubview($0) }
        
        [
            labelStackView,
            nameLabel
        ]
            .forEach { textStackView.addArrangedSubview($0) }
        
        buttonImageView.snp.makeConstraints {
            $0.width.equalTo(12.0)
            $0.height.equalTo(20.0)
        }
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 15.0
        
        [
            cardImageView,
            textStackView,
            buttonImageView
        ]
            .forEach { stackView.addArrangedSubview($0) }
        
        cardImageView.snp.makeConstraints {
            $0.width.equalTo(70.0)
            $0.height.equalTo(40.0)
            $0.leading.equalToSuperview().inset(10.0)
        }
        
        benefitLabel.snp.makeConstraints {
            $0.width.equalTo(80.0)
            $0.height.equalTo(20.0)
        }
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.width.equalTo(375.0)
            $0.height.equalTo(80.0)
            
            $0.top.leading.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10.0)
        }
    }
}
