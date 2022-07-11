//
//  SceneDelegate.swift
//  KeywordNews
//
//  Created by kid cherish on 2022/07/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        window?.backgroundColor = .systemBackground
        window?.tintColor = .systemOrange
        window?.rootViewController = UINavigationController(rootViewController: NewsListViewController())
        window?.makeKeyAndVisible()
    }
}
