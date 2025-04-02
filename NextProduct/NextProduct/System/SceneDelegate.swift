//
//  SceneDelegate.swift
//  NextProduct
//
//  Created by Сомов Кирилл on 02.04.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let rootViewController = MainViewController(productFactory: ProductFaсtory())
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

