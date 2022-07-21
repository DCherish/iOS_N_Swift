//
//  UIButton.swift
//  NetflixStyleSample
//
//  Created by kid cherish on 2022/06/07.
//

import UIKit

extension UIButton {
//    func adjustVerticalLayout(_ spacing: CGFloat = 0) {
//        MARK: Target iOS 14.x-
//        let imageSize = self.imageView?.frame.size ?? .zero
//        let titleLableSize = self.titleLabel?.frame.size ?? .zero
//
//        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
//        self.imageEdgeInsets = UIEdgeInsets(top: -(titleLableSize.height + spacing), left: 0, bottom: 0, right: -titleLableSize.width)
//    }
    
    func setLayout(_ title: String = "", _ fontSize: CGFloat = 0, _ spacing: CGFloat = 0) {
        // MARK: Targer iOS 15.0+
        var config = UIButton.Configuration.plain()
        
        var attTitle = AttributedString.init(title)
        attTitle.font = .systemFont(ofSize: fontSize)
        config.attributedTitle = attTitle
        
        config.imagePlacement = .top
        config.imagePadding = spacing
        config.baseForegroundColor = .white

        self.configuration = config
    }
}
