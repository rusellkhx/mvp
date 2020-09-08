//
//  SceneDelegate.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 02.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let mainVC = ModuleBuilder.createMainModule()
        let navBar = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navBar
        window?.makeKeyAndVisible()
    }

}

