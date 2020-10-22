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
    func getSubBreedImages()
    func getCountItem() -> Int
    func breedName() -> String
    var subBreedResults: [String] { get }
    func configurateCell(_ cell: ImageViewCellProtocol, item: Int)
    func setSaveDog(_ name: String, _ photoURL: String)
    func deleteDog(imageURL: String) 
}

class ImagePresenter: ImagePresenterProtocol {

    let breedApi = BreedRequests()
    let storageService = StorageService()
    
    var breedNameForImages: String
    var imageBreed: [ImageBreed]!
    var subBreedResults = [String] ()
    
    private unowned let view: ImageViewControllerProtocol
    
    required init(view: ImageViewControllerProtocol, breedNameForImages: String) {
        self.view = view
        self.breedNameForImages = breedNameForImages
    }
    
    func getSubBreedImages() {
        self.view.startActivityIdicator()
        breedApi.getSubBreedImages(breed: breedNameForImages){ [weak self] (data, error) in
            guard let self = self else { return }
            
            self.view.stopActivityIdicator()
            if let error = error as? CustomError {
                self.view.showErrorAlert(message: error.localizedDescription)
                return
            }
            
            if let data = data as? [ImageBreed] {
                self.imageBreed = data
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
        return breedNameForImages.capitalized
    }
    
    func configurateCell(_ cell: ImageViewCellProtocol, item: Int) {
        var isFavourite = false
        
        DispatchQueue.global(qos: .userInteractive).async {
            let url = self.subBreedResults[item]
            DispatchQueue.main.async {
                if self.storageService.readImage(imageURL: url) {
                    isFavourite = true
                } else {
                    isFavourite = false
                }
                cell.configureCell(imageURL: self.subBreedResults[item], isFavourite: isFavourite)
            }
        }
    }
    
    func setSaveDog(_ name: String, _ photoURL: String) {
        self.storageService.saveModel(name, photoURL)
        self.view.reloadCollection()
    }
    
    func deleteDog(imageURL: String) {
        self.storageService.deleteModel(imageURL: imageURL)
        self.view.reloadCollection()
    }
}

