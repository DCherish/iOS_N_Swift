//
//  ContentView.swift
//  NetflixStyleSwiftUISample
//
//  Created by kid cherish on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    let titles = ["Netfilx Sample App"]
    var body: some View {
        NavigationView {
            List(titles, id: \.self) {
                let netfilxVC = HomeViewControllerRepresentable()
                    .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.all)
                
                NavigationLink($0, destination: netfilxVC)
            }
            .navigationTitle("SwiftUI with UIKit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
