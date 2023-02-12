//
//  RankingFeatureSectionPresenter.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit

protocol RankingFeatureSectionProtocol: AnyObject {
    func setupViews()
    func reloadData()
}

final class RankingFeatureSectionPresenter: NSObject {
    private let view: RankingFeatureSectionProtocol
    
    private var rankingFeatureList: [RankingFeature] = []
    
    init (view: RankingFeatureSectionProtocol) {
        self.view = view
    }
    
    func setup() {
        view.setupViews()
        
        fetchData()
        view.reloadData()
    }
}

extension RankingFeatureSectionPresenter: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.frame.width - 32.0, height: RankingFeatureSectionCollectionViewCell.height)
    }
}

extension RankingFeatureSectionPresenter: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return rankingFeatureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RankingFeatureSectionCollectionViewCell.identifier,
            for: indexPath
        ) as? RankingFeatureSectionCollectionViewCell
        
        let rankingFeature = rankingFeatureList[indexPath.item]
        cell?.setup(rankingFeature: rankingFeature)
        
        return cell ?? UICollectionViewCell()
    }
}

private extension RankingFeatureSectionPresenter {
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "RankingFeature", withExtension: "plist") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([RankingFeature].self, from: data)
            rankingFeatureList = result
        } catch {
            
        }
    }
    
}
