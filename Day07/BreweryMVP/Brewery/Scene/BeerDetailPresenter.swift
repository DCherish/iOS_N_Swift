//
//  BeerDetailPresenter.swift
//  Brewery
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit

protocol BeerDetailProtocol: AnyObject {
    func setupNavigationBar(name: String?)
    func setupTableView()
    func setupLayout(url: String?)
}

final class BeerDetailPresenter: NSObject {
    private weak var viewController: BeerDetailProtocol?
    private let beer: Beer
    
    init(
        viewController: BeerDetailProtocol,
        beer: Beer
    ) {
        self.viewController = viewController
        self.beer = beer
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar(name: beer.name)
        viewController.setupTableView()
        viewController.setupLayout(url: beer.imageURL)
    }
}

extension BeerDetailPresenter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch section {
        case 3:
            return beer.foodPairing?.count ?? 0
        default:
            return 1
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        switch section {
        case 0:
            return "ID"
        case 1:
            return "Description"
        case 2:
            return "Brewers Tips"
        case 3:
            let isFoodPairingEmpty = beer.foodPairing?.isEmpty ?? true
            return isFoodPairingEmpty ? nil : "Food Pairing"
        default:
            return nil
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "BeerDetailListCell")
        cell.selectionStyle = .none
        
        var content = cell.defaultContentConfiguration()
        content.textProperties.numberOfLines = 0
                
        switch indexPath.section {
        case 0:
            content.text = String(describing: beer.id ?? 0)
        case 1:
            content.text = beer.description ?? "설명 없는 맥주"
        case 2:
            content.text = beer.brewersTips ?? "팁 없는 맥주"
        case 3:
            content.text = beer.foodPairing?[indexPath.row] ?? ""
        default:
            break
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}
