//
//  BeerListPresenter.swift
//  Brewery
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit

protocol BeerListProtocol: AnyObject {
    func setupNavigationBar()
    func setupTableView()
    func moveToBeerDetailView(beer: Beer)
    func reloadData()
}

final class BeerListPresenter: NSObject {
    private weak var viewController: BeerListProtocol?
    
//    private var beerList = [Beer]()
    var beerList = [Beer]()
    
    private let beerAPIManager: BeerAPIManagerProtocol
    
    private var currentPage = 1
    
    init (
        viewController: BeerListProtocol,
        beerAPIManager: BeerAPIManagerProtocol = BeerAPIManager()
    ) {
        self.viewController = viewController
        self.beerAPIManager = beerAPIManager
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupTableView()
        
        fetchBeer(of: currentPage)
    }
}

extension BeerListPresenter: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return beerList.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BeerListCell.identifier,
            for: indexPath
        ) as? BeerListCell else { return UITableViewCell() }
                
        let beer = beerList[indexPath.row]
        cell.configure(with: beer)
        
        return cell
    }
}

extension BeerListPresenter: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let selectedBeer = beerList[indexPath.row]

        viewController.moveToBeerDetailView(beer: selectedBeer)
    }
}

extension BeerListPresenter: UITableViewDataSourcePrefetching {
    func tableView(
        _ tableView: UITableView,
        prefetchRowsAt indexPaths: [IndexPath]
    ) {
        guard currentPage != 1 else { return }

        indexPaths.forEach {
            if ($0.row + 1) / 25 + 1 == currentPage {
                fetchBeer(of: currentPage)
            }
        }
    }
}

//private extension BeerListPresenter {
extension BeerListPresenter {
    func fetchBeer(of page: Int) {
        beerAPIManager.request(of: page) { [weak self] list in
            self?.beerList += list
            self?.currentPage += 1
            
            self?.viewController.reloadData()
        }
    }
}


