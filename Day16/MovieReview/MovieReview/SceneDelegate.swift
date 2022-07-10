//
//  SceneDelegate.swift
//  MovieReview
//
//  Created by kid cherish on 2022/07/09.
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
        window?.rootViewController = UINavigationController(rootViewController: MovieListViewController())
        window?.makeKeyAndVisible()
    }
}
