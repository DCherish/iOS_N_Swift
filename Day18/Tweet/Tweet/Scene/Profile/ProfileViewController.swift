//
//  ProfileViewController.swift
//  Tweet
//
//  Created by kid cherish on 2022/07/12.
//

import UIKit
import SnapKit
import Toast

final class ProfileViewController: UIViewController {
    private lazy var presenter = ProfilePresenter(viewController: self)
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 26.0, weight: .bold)
        
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var accountTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 16.0, weight: .medium)
        
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
//        // MARK: Target for iOS 14.x-
//        let button = UIButton()
//
//        button.setTitle("저장하기", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .bold)
//        button.contentEdgeInsets = UIEdgeInsets(~) // Deprecated
//        button.layer.cornerRadius = 15.0
//        button.backgroundColor = .systemBlue
//        button.setTitleColor(.white, for: .normal)
        
        // MARK: Target for iOS 15.0+
        var config = UIButton.Configuration.filled()
        
        var title = AttributedString.init("저장하기")
        title.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        config.attributedTitle = title
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        
        let button = UIButton(configuration: config)
        button.addTarget(
            self,
            action: #selector(didTapSaveButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ProfileViewController: ProfileProtocol {
    func setupViews() {
        navigationItem.title = "Profile"
        
        [nameTextField, accountTextField, saveButton]
            .forEach { view.addSubview($0) }
        
        let superViewInset: CGFloat = 16.0
        
        nameTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(superViewInset)
            $0.trailing.equalToSuperview().inset(superViewInset)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(superViewInset)
        }
        
        accountTextField.snp.makeConstraints {
            $0.leading.equalTo(nameTextField.snp.leading)
            $0.trailing.equalTo(nameTextField.snp.trailing)
            $0.top.equalTo(nameTextField.snp.bottom)
        }
        
        saveButton.snp.makeConstraints {
            $0.leading.equalTo(nameTextField.snp.leading)
            $0.trailing.equalTo(nameTextField.snp.trailing)
            $0.top.equalTo(accountTextField.snp.bottom).offset(superViewInset * 2)
        }
    }
    
    func setViews(with name: String, account: String) {
        nameTextField.text = name
        accountTextField.text = account
    }
    
    func endEditing() {
        view.endEditing(true)
    }
    
    func showToast() {
        view.makeToast("변경하고자 하는 내용을 입력해주세요.")
    }
}

private extension ProfileViewController {
    @objc func didTapSaveButton() {
        presenter.didTapSaveButton(
            name: nameTextField.text,
            account: accountTextField.text
        )
    }
}
