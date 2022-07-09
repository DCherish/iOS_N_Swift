//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import Foundation

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlertController()
    func close()
    func setupViews()
    func presentToSearchBookViewController()
    func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
//    private var book: Book?
    var book: Book? // test를 위해 private 잠시 해제
    
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
    
    init(
        viewController: ReviewWriteProtocol,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButtonItem() {
        viewController.showCloseAlertController()
    }
    
    func didTapRightBarButtonItem(contentsText: String?) {
        guard
            let book = book,
            let contentsText = contentsText,
            contentsText != contentsTextViewPlaceHolderText
        else { return }
        
        let bookReview = BookReview(
            title: book.title,
            contents: contentsText,
            imageURL: book.imageURL
        )
        userDefaultsManager.setReview(bookReview)
        
        viewController.close()
    }
    
    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegete {
    func selectBook(_ book: Book) {
        self.book = book
        
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
