//
//  TabBarController.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/08.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarViewControllers: [UIViewController] = TabBarItem.allCases
            .map { tabCase in
                let viewController = tabCase.viewController
                
                viewController.tabBarItem = UITabBarItem(
                    title: tabCase.title,
                    image: tabCase.icon,
                    tag: tabCase.tag
                )
                
                return viewController
            }
        
        viewControllers = tabBarViewControllers
    }
}


