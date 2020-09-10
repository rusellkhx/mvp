//
//  SubBreedsPresenter.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 08.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit

protocol SubBreedsPresenterProtocol: class {
    init(view: SubBreedsViewControllerProtocol, breed: String)
    func configurateCell(_ cell: BreedTableViewCellProtocol, item: Int)
    func getSubBreeds()
    func getCountItem() -> Int
    func breedName() -> String
}

class SubBreedsPresenter: SubBreedsPresenterProtocol {
   
    let breedApi = BreedRequests()
    let breed: String
    
    var dogbreed = ""
    var dogBreed: [SubBreeeds]!
    var subBreedResults: [String] = []
    
    private unowned let view: SubBreedsViewControllerProtocol
    
    required init(view: SubBreedsViewControllerProtocol, breed: String) {
        self.view = view
        self.breed = breed
    }
    
    func getCountItem() -> Int {
        return subBreedResults.count
    }
    
    func getSubBreeds() {
        self.view.startActivityIdicator()
        breedApi.getSubBreeds(breed: breed){ [weak self] (data, error) in
            guard let self = self else { return }
            
            self.view.stopActivityIdicator()
            if let error = error as? CustomError {
                self.view.showErrorAlert(message: error.localizedDescription)
                return
            }
            
            if let data = data as? [SubBreeeds] {
                self.dogBreed = data
                self.dogbreed = self.dogbreed.lowercased()
                let subBreedArray = self.dogBreed[0].message
                
                for type in subBreedArray {
                    self.subBreedResults.append(type)
                }
                self.view.reloadTable()
            }
        }
    }
    
    func configurateCell(_ cell: BreedTableViewCellProtocol, item: Int) {
        cell.display(title: "\(subBreedResults[item].capitalized)")
    }
    
    func breedName() -> String {
        return self.dogbreed
    }
       
       
}
