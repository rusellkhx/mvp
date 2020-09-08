//
//  BreedPresenter.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 06.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit

protocol BreedPresenterProtocol: class {
    init(view: BreedViewControllerProtocol)
    func configurateCell(_ cell: BreedTableViewCellProtocol, item: Int)
    func getCountItem() -> Int
    //func heightForFooter() -> CGFloat
    //func heightForCell() -> CGFloat
}

class BreedPresenter: BreedPresenterProtocol {
    
    let breedApi = BreedRequests()
    var dogBreed: [Breed]!
    var breedResults: [String] = []
    var finalResult: [String : [String]] = ["":[""]]
    
    private unowned let view: BreedViewControllerProtocol

    required init(view: BreedViewControllerProtocol) {
        self.view = view
        getBreed()
    }
    
    private func getBreed() {
        self.view.startActivityIdicator()
        breedApi.getBreed(){ [weak self] (data, error) in
            guard let self = self else { return }
            
            self.view.stopActivityIdicator()
            if let error = error as? CustomError {
                self.view.showErrorAlert(message: error.localizedDescription)
                return
            }
            
            if let data = data as? [Breed] {
                self.dogBreed = data
                self.finalResult = self.dogBreed[0].message
                let breedArray = self.dogBreed[0].message.keys.sorted()
                for type in breedArray {
                    self.breedResults.append(type)
                }
                self.view.reloadTable()
            }
        }
    }
    
    func getCountItem() -> Int {
        return breedResults.count
    }
    
    func configurateCell(_ cell: BreedTableViewCellProtocol, item: Int) {
        let number = finalResult[breedResults[item]]?.count ?? 0
        
        if  number == 1 {
            cell.display(title: "\(breedResults[item].capitalized) (\(finalResult[breedResults[item]]?.count ?? 0) subbreed)")
        } else if number == 0 {
            cell.display(title: "\(breedResults[item].capitalized)")
        } else {
            cell.display(title: "\(breedResults[item].capitalized) (\(finalResult[breedResults[item]]?.count ?? 0) subbreeds)")
        }
        
    }
    
    /*func heightForFooter() -> CGFloat {
        return 20
    }
    
    func heightForCell() -> CGFloat {
        return 60
    }*/
    
}





