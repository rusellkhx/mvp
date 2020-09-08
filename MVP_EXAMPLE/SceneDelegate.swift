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
    var firstTabNavigationController : UINavigationController!
    var secondTabNavigationControoller : UINavigationController!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let tabBarController = UITabBarController()
        let mainVC = ModuleBuilder.createMainModule()
        let favouritesVC = ModuleBuilder.createFavouritesModule()
        
        firstTabNavigationController = UINavigationController.init(rootViewController: mainVC)
        secondTabNavigationControoller = UINavigationController.init(rootViewController: favouritesVC)
        
        tabBarController.viewControllers = [firstTabNavigationController,
                                            secondTabNavigationControoller]
        
        let item1 = UITabBarItem(title: "List", image: UIImage(systemName: "list.bullet"), tag: 0)
        let item2 = UITabBarItem(title: "Favourites", image: UIImage(systemName: "heart.fill"), tag: 1)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
        
        self.window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

}

