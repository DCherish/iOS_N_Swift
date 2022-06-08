//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by kid cherish on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .padding()
        MyView(helloFont: .title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
