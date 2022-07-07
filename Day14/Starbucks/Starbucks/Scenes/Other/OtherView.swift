//
//  OtherView.swift
//  Starbucks
//
//  Created by kid cherish on 2022/07/07.
//

import SwiftUI

struct OtherView: View {
    init() {
        UITableView.appearance().backgroundColor = .systemBackground
    } // 한 번 설정한 이후부터는 모두 적용
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Menu.allCases) { section in
                    Section(
                        content: {
                            ForEach(section.menu, id: \.hashValue) { raw in
                                NavigationLink(raw, destination: Text("\(raw)"))
                            }
                        },
                        header: {
                            Text(section.title)
                        }
                    )
                }
            }
                .listStyle(GroupedListStyle())
                .navigationTitle("Other")
                .toolbar(content: {
                    NavigationLink(
                        destination: SettingView(),
                        label: {
                            Image(systemName: "gear")
                        }
                    )
                })
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
