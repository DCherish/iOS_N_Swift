//
//  FindCoronaCenterApp.swift
//  FindCoronaCenter
//
//  Created by kid cherish on 2022/07/06.
//

import SwiftUI

@main
struct MyAssetsApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            SelectRegionView()
        }
    }
}
