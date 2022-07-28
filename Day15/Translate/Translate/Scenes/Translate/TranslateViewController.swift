//
//  TranslateViewController.swift
//  Translate
//
//  Created by kid cherish on 2022/07/07.
//

import SnapKit
import UIKit
import Toast

final class TranslateViewController: UIViewController {
    private var translatorManager = TranslatorManager()
    
    private lazy var sourceLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(translatorManager.sourceLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        
        button.addTarget(self, action: #selector(didTapSourceLanguageButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var targetLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(translatorManager.targetLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        
        button.addTarget(self, action: #selector(didTapTargetLanguageButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        [sourceLanguageButton, targetLanguageButton]
            .forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var resultBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23.0, weight: .bold)
        label.textColor = UIColor.mainTintColor
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.addTarget(self, action: #selector(didTapBookmarkButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var copyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.addTarget(self, action: #selector(didTapCopyButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var sourceLabelBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSourceLabelBaseView))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    private lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Enter_text", comment: "텍스트 입력")
        label.textColor = .tertiaryLabel
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 23.0, weight: .semibold)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        setupViews()
    }
}

extension TranslateViewController: SourceTextViewControllerDelegate {
    func didEnterText(_ sourceText: String) {
        if sourceText == "" { return }
        
        sourceLabel.textColor = .label
        sourceLabel.text = sourceText
        
        translatorManager.translate(from: sourceText) { [weak self] translatedText in
            self?.resultLabel.text = translatedText
        }
        
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
}

private extension TranslateViewController {
    func setupViews() {
        [
            buttonStackView,
            resultBaseView,
            resultLabel,
            bookmarkButton,
            copyButton,
            sourceLabelBaseView,
            sourceLabel
        ]
            .forEach { view.addSubview($0) }
        
        let defaultSpacing: CGFloat = 16.0
        let defaultSpacing2: CGFloat = 24.0
        
        let defaultLength: CGFloat = 40.0
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(defaultSpacing)
            $0.trailing.equalToSuperview().inset(defaultSpacing)
            $0.height.equalTo(50.0)
        }
        
        resultBaseView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(buttonStackView.snp.bottom).offset(defaultSpacing)
            $0.bottom.equalTo(bookmarkButton.snp.bottom).offset(defaultSpacing)
        }
        
        resultLabel.snp.makeConstraints {
            $0.leading.equalTo(resultBaseView.snp.leading).offset(defaultSpacing2)
            $0.trailing.equalTo(resultBaseView.snp.trailing).offset(-1 * defaultSpacing2)
            $0.top.equalTo(resultBaseView.snp.top).offset(defaultSpacing2)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.leading.equalTo(resultLabel.snp.leading)
            $0.top.equalTo(resultLabel.snp.bottom).offset(defaultSpacing2)
            $0.width.equalTo(defaultLength)
            $0.height.equalTo(defaultLength)
        }
        
        copyButton.snp.makeConstraints {
            $0.leading.equalTo(bookmarkButton.snp.trailing).offset(-1 * 8.0)
            $0.top.equalTo(bookmarkButton.snp.top)
            $0.width.equalTo(defaultLength)
            $0.height.equalTo(defaultLength)
        }
        
        sourceLabelBaseView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(resultBaseView.snp.bottom).offset(defaultSpacing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        sourceLabel.snp.makeConstraints {
            $0.leading.equalTo(sourceLabelBaseView.snp.leading).offset(defaultSpacing2)
            $0.trailing.equalTo(sourceLabelBaseView.snp.trailing).offset(-1 * defaultSpacing2)
            $0.top.equalTo(sourceLabelBaseView.snp.top).offset(defaultSpacing2)
        }
    }
    
    @objc func didTapSourceLanguageButton() {
        didTapLanguageButton(type: .source)
    }
    
    @objc func didTapTargetLanguageButton() {
        didTapLanguageButton(type: .target)
    }
    
    func didTapLanguageButton(type: Type) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        Language.allCases.forEach { language in
            let action = UIAlertAction(title: language.title, style: .default) { [weak self] _ in
                switch type {
                case .source:
                    self?.translatorManager.sourceLanguage = language
                    self?.sourceLanguageButton.setTitle(language.title, for: .normal)
                case .target:
                    self?.translatorManager.targetLanguage = language
                    self?.targetLanguageButton.setTitle(language.title, for: .normal)
                }
            }
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(
            title: NSLocalizedString("Cancel", comment: "취소하기"),
            style: .cancel,
            handler: nil
        )
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }

    @objc func didTapBookmarkButton() {
        guard let sourceText = sourceLabel.text,
              let translatedText = resultLabel.text,
              bookmarkButton.imageView?.image == UIImage(systemName: "bookmark") else { return }
        
        bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        
        let currentBookmarks: [Bookmark] = UserDefaults.standard.bookmarks
        let newBookmark = Bookmark(
            sourceLanguage: translatorManager.sourceLanguage,
            translatedLanguage: translatorManager.targetLanguage,
            sourceText: sourceText,
            translatedText: translatedText
        )
        
        UserDefaults.standard.bookmarks = [newBookmark] + currentBookmarks
        
        var style = ToastStyle()

        style.messageFont = .systemFont(ofSize: 16.0, weight: .bold)
        style.backgroundColor = UIColor.mainTintColor
        view.makeToast(NSLocalizedString("Save_Success", comment: "저장완료"), duration: 1.0, style: style)
    }
    
    @objc func didTapCopyButton() {
        UIPasteboard.general.string = resultLabel.text
        
        var style = ToastStyle()

        style.messageFont = .systemFont(ofSize: 16.0, weight: .bold)
        style.backgroundColor = UIColor.mainTintColor
        view.makeToast(NSLocalizedString("Copy_Success", comment: "복사"), duration: 1.0, style: style)
    }
    
    @objc func didTapSourceLabelBaseView() {
        let viewController = SourceTextViewController(delegate: self)
        present(viewController, animated: true)
    }
}
