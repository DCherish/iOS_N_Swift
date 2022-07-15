//
//  RoundButton.swift
//  Calculator
//
//  Created by kid cherish on 2022/05/27.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                // MARK: Target iOS 15.0+
                let title = self.titleLabel?.text ?? ""
                self.setTitle(nil, for: .normal)

                var config = UIButton.Configuration.filled()
                config.cornerStyle = .capsule

                var newTitle = AttributedString.init(title)
                newTitle.font = UIFont.systemFont(ofSize: 30.0, weight: .medium)

                config.attributedTitle = newTitle

                if title == "AC" {
                    config.baseForegroundColor = .black
                } else {
                    config.baseForegroundColor = .white
                }
                
                config.baseBackgroundColor = self.backgroundColor
                self.backgroundColor = .clear

                self.configuration = config

//                // MARK: Target iOS 14.x- & fix ViewController some code
//                self.layer.cornerRadius = self.frame.height / 2 - 4.0
            }
        }
    }
}
