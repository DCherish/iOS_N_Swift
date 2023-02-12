//
//  TabBarItem.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/08.
//

import UIKit

enum TabBarItem: CaseIterable {
    case today
    case app
    
    var title: String {
        switch self {
        case .today: return "투데이"
        case .app: return "앱"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .today: return UIImage(systemName: "mail")
        case .app: return UIImage(systemName: "square.stack.3d.up")
        }
    }
    
    var tag: Int {
        switch self {
        case .today: return 0
        case .app: return 1
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .today: return TodayViewController()
        case .app: return UINavigationController(rootViewController: AppViewController())
        }
    }
}
