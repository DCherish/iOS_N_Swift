//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by kid cherish on 2022/05/26.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    
    var LEDText: String?
    var textColor: UIColor = .green
    var backgroundColor: UIColor = .orange
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        if let LEDText = self.LEDText {
            self.textField.text = LEDText
        }
        
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
        self.navigationController?.navigationBar.barStyle = .default
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.greenButton {
            self.changeTextColor(color: .green)
            self.textColor = .green
        } else if sender == self.blueButton {
            self.changeTextColor(color: .blue)
            self.textColor = .blue
        } else if sender == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.orangeButton {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        } else if sender == self.purpleButton {
            self.changeBackgroundColor(color: .purple)
            self.backgroundColor = .purple
        } else if sender == self.blackButton {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        }
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor
        )
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor) {
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.3
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.3
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.3
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.3
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.3
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.3
    }
}
