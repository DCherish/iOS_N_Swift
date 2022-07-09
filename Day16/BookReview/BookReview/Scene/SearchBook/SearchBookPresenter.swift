//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import UIKit

protocol SearchBookProtocol {
    func setupViews()
    func dismiss()
    func reloadView()
}

protocol SearchBookDelegete {
    func selectBook(_ book: Book)
}

final class SearchBookPresenter: NSObject {
    private var state: Bool = false
    
    private let viewController: SearchBookProtocol
    private let bookSearchManager = BookSearchManager()
    private let delegate: SearchBookDelegete
    
    private var books: [Book] = []
    
    init(
        viewController: SearchBookProtocol,
        delagete: SearchBookDelegete
    ) {
        self.viewController = viewController
        self.delegate = delagete
        
    }
    
    func viewDidLoad() {
        viewController.setupViews()
    }
}

extension SearchBookPresenter: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        state = true
        bookSearchManager.request(from: searchText) { [weak self] newBooks in
            self?.books = newBooks
            self?.viewController.reloadView()
        }
    }
}

extension SearchBookPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !state {
            return 0
        }
        
        if books.count == 0 {
            return 1
        } else {
            return books.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if (books.count == 0) {
            cell.textLabel?.text = "검색 결과를 찾을 수 없습니다."
        } else {
            cell.textLabel?.text = books[indexPath.row].title
        }
        
        return cell
    }
}

extension SearchBookPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = books[indexPath.row]
        delegate.selectBook(selectedBook)
        
        viewController.dismiss()
    }
}
