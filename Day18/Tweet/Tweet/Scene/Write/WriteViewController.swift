//
//  WriteViewController.swift
//  Tweet
//
//  Created by kid cherish on 2022/07/12.
//

import UIKit
import SnapKit

final class WriteViewController: UIViewController {
    private lazy var presenter = WritePresenter(viewController: self)
    
    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            title: "닫기",
            style: .plain,
            target: self,
            action: #selector(didTapLeftBarButtonItem)
        )
        
        return barButtonItem
    }()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            title: "트윗",
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButtonItem)
        )
        
        return barButtonItem
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16.0, weight: .medium)
        
        textView.textColor = .secondaryLabel
        textView.text = "무슨 일이 일어나고 있나요?"
        
        textView.delegate = self
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension WriteViewController: WriteProtocol {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.addSubview(textView)
        
        let superViewInset: CGFloat = 16.0
        
        textView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(superViewInset)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(superViewInset)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(superViewInset)
            $0.height.equalTo(160.0)
        }
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}

private extension WriteViewController {
    @objc func didTapLeftBarButtonItem() {
        presenter.didTapLeftBarButtonItem()
    }
    
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem(text: textView.text)
    }
}

extension WriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.textColor = .label
        textView.text = ""
        rightBarButtonItem.isEnabled = !textView.text.isEmpty
    }
    
    func textViewDidChange(_ textView: UITextView) {
        guard textView.textColor != .secondaryLabel else { return }
        
        rightBarButtonItem.isEnabled = !textView.text.isEmpty
    }
}
