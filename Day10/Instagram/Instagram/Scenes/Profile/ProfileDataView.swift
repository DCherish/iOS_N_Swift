//
//  ProfileDataView.swift
//  Instagram
//
//  Created by kid cherish on 2022/06/11.
//

import UIKit
import SnapKit

final class ProfileDataView: UIView {
    private let count: Int
    private let title: String
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.text = "\(count)"
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.text = title
        
        return label
    }()
    
    init(count: Int, title: String) {
        self.count = count
        self.title = title
        
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProfileDataView {
    func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [countLabel, titleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4.0
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
