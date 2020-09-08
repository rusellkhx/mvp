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
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        
        let view = BreedViewController()
        let presenter = BreedPresenter(view: view)
        view.presenter = presenter
        
        return view
    }
    
    
}
