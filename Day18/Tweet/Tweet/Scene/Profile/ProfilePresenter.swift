//
//  ProfilePresenter.swift
//  Tweet
//
//  Created by kid cherish on 2022/07/12.
//

import Foundation

protocol ProfileProtocol: AnyObject {
    func setupViews()
    func setViews(with name: String, account: String)
    func endEditing()
    func showToast(_ type: String)
}

final class ProfilePresenter {
    private weak var viewController: ProfileProtocol?
    private var user: User {
        get { User.shared }
        set { User.shared = newValue }
    }
    
    init(viewController: ProfileProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupViews()
    }
    
    func viewWillAppear() {
        viewController?.setViews(with: user.name, account: user.account)
    }
    
    func didTapSaveButton(name: String?, account: String?) {
        if name == nil || name == "" {
            viewController?.endEditing()
            viewController?.showToast("name")
            return
        } else if account == nil || account == "" {
            viewController?.endEditing()
            viewController?.showToast("account")
            return
        }
        
        viewController?.endEditing()
        
        if let name = name {
            user.name = name
        }
        
        if let account = account {
            user.account = account
        }
        
        viewController?.setViews(with: user.name, account: user.account)
        viewController?.showToast("success")
    }
}
