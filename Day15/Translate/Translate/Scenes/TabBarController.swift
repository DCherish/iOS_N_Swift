//
//  TabBarController.swift
//  Translate
//
//  Created by kid cherish on 2022/07/07.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let translateViewController = TranslateViewController()
        translateViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Translate", comment: "번역"),
            image: UIImage(systemName: "mic"),
            selectedImage: UIImage(systemName: "mic.fill")
        )
        
        let bookmarkViewController = UINavigationController(rootViewController: BookmarkListViewController())
        bookmarkViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Bookmark", comment: "즐겨찾기"),
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill")
        )
        
        tabBar.setUpUITabBar()
        
        viewControllers = [translateViewController, bookmarkViewController]
    }
}

extension UITabBar {
    func setUpUITabBar() {
        self.backgroundColor = .secondarySystemBackground
        self.backgroundImage = UIImage()
        self.shadowImage = UIImage()
        self.clipsToBounds = true
    }
}
