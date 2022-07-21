//
//  TodayColletionHeaderView.swift
//  AppStore
//
//  Created by kid cherish on 2022/06/10.
//

import UIKit
import SnapKit

final class TodayColletionHeaderView: UICollectionReusableView {
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "6월 10일 금요일"
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "투데이"
        label.font = .systemFont(ofSize: 36.0, weight: .black)
        label.textColor = .label
        
        return label
    }()
    
    func setupSubViews() {
        [dateLabel, titleLabel]
            .forEach {
                addSubview($0)
            }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16.0)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(32.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8.0)
        }
    }
}
