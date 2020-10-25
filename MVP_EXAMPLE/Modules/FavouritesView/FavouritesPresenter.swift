//
//  FavouritesPresenter.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 08.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation

protocol FavouritesPresenterProtocol: class {
    init(view: FavouritesViewControllerProtocol)
    func configurateCell(_ cell: BreedTableViewCellProtocol, item: Int)
    func pressCell(_ item: Int)
    func getCountItem() -> Int
    var dogBreed: [Breed]? { get }
    func getBreed()
}

class FavouritesPresenter: FavouritesPresenterProtocol {
    
    var dogBreed: [Breed]?
    let storageService = StorageService()
    var dogRestore: [BreedRealm]!
    
    private unowned let view: FavouritesViewControllerProtocol
    
    required init(view: FavouritesViewControllerProtocol) {
        self.view = view
    }
    
    func getBreed() {
        guard let dogRestore2 = self.storageService.readModel() else { return }
        dogRestore = dogRestore2
        self.view.reloadTable()
    }
    
    func configurateCell(_ cell: BreedTableViewCellProtocol, item: Int) {
        cell.display(title: "\(dogRestore[item].breed) (\(dogRestore[item].image.count ) photos)")
    }
    
    func getCountItem() -> Int {
        dogRestore.count
    }
    
    func pressCell(_ item: Int) {
        let images = dogRestore[item].image
        let breed = dogRestore[item].breed

        let imageBreedViewController = ModuleBuilder.createImageBreedModule(breedNameForImages: "\(images[item].imageURL)",                                                                      breedName: "\(breed)",
                                                                            sourceImages: false)
        self.view.pushToVC(imageBreedViewController)
    }
}
