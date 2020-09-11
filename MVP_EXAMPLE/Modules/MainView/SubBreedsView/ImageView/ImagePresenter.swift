//
//  ImagePresenter.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 11.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation

protocol ImagePresenterProtocol: class {
    init(view: ImageViewControllerProtocol, breedNameForImages: String)
    //func configurateCell(_ cell: BreedTableViewCellProtocol, item: Int)
    func getSubBreedImages()
    func getCountItem() -> Int
    func breedName() -> String
}

class ImagePresenter: ImagePresenterProtocol {
    
    let breedApi = BreedRequests()
    
    var dogBreedForDescription = ""
    var breedNameForImages: String
    var imageBreed: [ImageBreed]!
    var subBreedResults: [String] = []
    
    private unowned let view: ImageViewControllerProtocol
    
    required init(view: ImageViewControllerProtocol, breedNameForImages: String) {
        self.view = view
        self.breedNameForImages = breedNameForImages
    }

    func getSubBreedImages() {
        self.view.startActivityIdicator()
        breedApi.getSubBreeds(breed: breedNameForImages){ [weak self] (data, error) in
            guard let self = self else { return }
            
            self.view.stopActivityIdicator()
            if let error = error as? CustomError {
                self.view.showErrorAlert(message: error.localizedDescription)
                return
            }
            
            if let data = data as? [ImageBreed] {
                self.imageBreed = data
                self.dogBreedForDescription = self.dogBreedForDescription.lowercased()
                let subBreedArray = self.imageBreed[0].message
                
                for type in subBreedArray {
                    self.subBreedResults.append(type)
                }
                self.view.reloadCollection()
            }
        }
    }
    
    func getCountItem() -> Int {
        return subBreedResults.count
    }
    
    func breedName() -> String {
        return self.dogBreedForDescription
    }
}

