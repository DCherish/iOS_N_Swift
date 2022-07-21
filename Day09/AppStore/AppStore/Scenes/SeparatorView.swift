//
//  SeparatorView.swift
//  AppStore
//
//  Created by kid cherish on 2022/06/10.
//

import UIKit
import SnapKit

final class SeparatorView: UIView {
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .separator
        
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SeparatorView {
    func setupView() {
        addSubview(separator)
        
        separator.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
}
