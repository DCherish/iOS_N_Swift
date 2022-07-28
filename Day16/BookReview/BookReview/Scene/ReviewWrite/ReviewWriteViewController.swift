//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import SnapKit
import UIKit
import Kingfisher

final class ReviewWriteViewController: UIViewController {
    private lazy var presenter = ReviewWritePresenter(viewController: self)
    
    private lazy var bookTitleButton: UIButton = {
        let button = UIButton()
        button.setTitle("책 제목", for: .normal)
        button.setTitleColor(.tertiaryLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 23.0, weight: .bold)
        button.addTarget(self, action: #selector(didTapBookTitleButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var contentsTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .tertiaryLabel
        textView.text = presenter.contentsTextViewPlaceHolderText
        textView.font = .systemFont(ofSize: 16.0, weight: .medium)
        
        textView.delegate = self // 어떠한 데이터 다루는 것이 아니라 단순히 view의 ui action 처리에 가까우므로
        
        return textView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension ReviewWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .tertiaryLabel else { return }
        
        textView.text = ""
        textView.textColor = .label
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard textView.text == "" else { return }

        textView.text = presenter.contentsTextViewPlaceHolderText
        textView.textColor = .tertiaryLabel
    }
}

extension ReviewWriteViewController: ReviewWriteProtocol {
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(didTapLeftBarButtonItem)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(didTapRightBarButtonItem)
        )
    }
    
    func showCloseAlertController() {
        let alertController = UIAlertController(
            title: "작성중인 내용이 있습니다. 정말 닫으시겠습니까?",
            message: nil,
            preferredStyle: .alert
        )
        
        let closeAction = UIAlertAction(title: "닫기", style: .destructive) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        [closeAction, cancelAction].forEach { action in
            alertController.addAction(action)
        }
        
        present(alertController, animated: true)
    }
    
    func close() {
        dismiss(animated: true)
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        [bookTitleButton, contentsTextView, imageView]
            .forEach { view.addSubview($0) }
        
        bookTitleButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20.0)
        }
        
        contentsTextView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(bookTitleButton.snp.bottom).offset(16.0)
        }
        
        imageView.snp.makeConstraints {
            $0.leading.equalTo(contentsTextView.snp.leading)
            $0.trailing.equalTo(contentsTextView.snp.trailing)
            $0.top.equalTo(contentsTextView.snp.bottom).offset(16.0)
            
            $0.height.equalTo(200.0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func presentToSearchBookViewController() {
        let viewController = UINavigationController(
            rootViewController: SearchBookViewController(searchBookDelegate: presenter)
        )
        
        present(viewController, animated: true)
    }
    
    func updateViews(title: String, imageURL: URL?) {
        bookTitleButton.setTitleColor(.label, for: .normal)
        bookTitleButton.setTitle(title, for: .normal)
        
        imageView.kf.setImage(with: imageURL)
    }
}

private extension ReviewWriteViewController {
    @objc func didTapLeftBarButtonItem() {
        presenter.didTapLeftBarButtonItem()
    }
    
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem(contentsText: contentsTextView.text)
    }
    
    @objc func didTapBookTitleButton() {
        presenter.didTapBookTitleButton()
    }
}
