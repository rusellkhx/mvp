//
//  BuilderModule.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 08.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createSubBreedModule(breed: String) -> UIViewController
    static func createImageBreedModule(breedNameForImages: String) -> UIViewController
    static func createFavouritesModule() -> UIViewController
}

class ModuleBuilder: Builder {
    
        static func createMainModule() -> UIViewController {
        let view = BreedViewController()
        let presenter = BreedPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func createSubBreedModule(breed: String) -> UIViewController {
        let view = SubBreedsViewController()
        let presenter = SubBreedsPresenter(view: view, breed: breed)
        view.presenter = presenter
        return view
    }
    
    static func createImageBreedModule(breedNameForImages breed: String) -> UIViewController {
        let view = ImageViewController()
        let presenter = ImagePresenter(view: view, breedNameForImages: breed)
        view.presenter = presenter
        return view
    }
    
    static func createFavouritesModule() -> UIViewController {
        let view = FavouritesViewController()
        let presenter = FavouritesPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
