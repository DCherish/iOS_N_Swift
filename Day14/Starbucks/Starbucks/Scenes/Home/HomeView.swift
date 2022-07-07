//
//  HomeView.swift
//  Starbucks
//
//  Created by kid cherish on 2022/07/07.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            HomeHeaderView(isNeedToReload: $viewModel.isNeedToReload)
            Spacer(minLength: 16.0)
            MenuSuggestionSectionView(coffeeMenu: $viewModel.coffeeMenu)
            Spacer(minLength: 32.0)
            EventsSectionView(events: $viewModel.events)
            Spacer(minLength: 48.0)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
