//
//  SettingView.swift
//  Starbucks
//
//  Created by kid cherish on 2022/07/07.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            Section {
                SettingUserInfoSectionView()
            }
            
            Button("회원 정보 수정") {}
                .foregroundColor(.black)
//                .font(.body) // default
            Button("회원 정보 수정") {}
                .foregroundColor(.black)
        }
        .navigationTitle("설정")
        .listStyle(GroupedListStyle())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingUserInfoSectionView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(User.shared.userName)
                    .font(.title)
                Text(User.shared.account)
                    .font(.caption)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("로그아웃")
                    .font(.system(size: 14.0, weight: .bold, design: .default))
                    .foregroundColor(.green)
            }
                .padding(8.0)
                .overlay(Capsule().stroke(Color.green))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
