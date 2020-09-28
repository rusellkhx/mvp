//
//  ImageViewController.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 11.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

protocol ImageViewControllerProtocol: class {
    func startActivityIdicator()
    func stopActivityIdicator()
    func reloadCollection()
    func showMessageAlert(_ message: String)
    func showErrorAlert(message: String)
    func showChoiceAlert(title: String? , message: String?, customActions: [UIAlertAction])
    
}

class ImageViewController: UIViewController {
    
    @IBOutlet weak var collecView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let serviceStorage = StorageService()
    var presenter: ImagePresenterProtocol!
    var page = 0
    let realm = try! Realm()
    var dogs = Dog()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter.getSubBreedImages()
    }
    
    private func setupCollectionView() {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        layout.itemSize = UIScreen.main.bounds.size
        
        collecView.register(ImageViewCell.self)
        collecView.dataSource = self
        collecView.delegate = self
        collecView.collectionViewLayout = layout
        collecView.backgroundColor = .systemBackground
        collecView.showsVerticalScrollIndicator = false
        collecView.showsHorizontalScrollIndicator = false
        collecView.isPagingEnabled = true
    }
    
    private func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: HelperDescriptionImages.Navigation.sharePhoto),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(openAlert))
        setupNavBar()
        setupCollectionView()
        activityIndicator.center = self.view.center
        startActivityIdicator()
        
    }
    
    private func setupNavBar() {
        title = presenter.breedName()
    }
}

extension ImageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getCountItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collecView.create(ImageViewCell.self, indexPath)
        
        page = indexPath.row
        print("------")
        print(page)
        print("------")
        print(page - 1)
        let image: String = presenter.subBreedResults[indexPath.row] 
        
        cell.breedImageView.kf.setImage(with: URL(string: image), placeholder: UIImage(named: ""))
        cell.likeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return cell
    }
    
    @objc func buttonPressed()
    {
        /*let dog = Dog()
        dog.breed = presenter.breedName()
        dog.image = presenter.subBreedResults[page]
        dog.hasFavourited = true
        
        try! self.realm.write {
            self.realm.add(dog)
        }*/
        
        serviceStorage.changePhotoStatus(presenter.breedName(), presenter.subBreedResults[page])
        //print("Save Dog name:\(String(describing: dog.breed)), image: \(String(describing: dog.image)), hasFavourited:\(dog.hasFavourited)")
    }

}

extension ImageViewController: ImageViewControllerProtocol {
    func reloadCollection() {
        DispatchQueue.main.async {
            self.collecView.reloadData()
        }
    }
    
    func startActivityIdicator() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopActivityIdicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
}

extension ImageViewController {
    
    @objc func openAlert() {
        
        let optionMenu = UIAlertController(title: nil, message: "Share photo", preferredStyle: .actionSheet)
        
        let shareAction = UIAlertAction(title: "Share", style: .default, handler:
        {
            (alert: UIAlertAction!) -> Void in
            self.sharePhoto()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        optionMenu.addAction(shareAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true)
        
    }
    
    func sharePhoto() {
        if let photoURL = [presenter.subBreedResults[page - 1]] as? [Any] {
            let activityVC = UIActivityViewController(activityItems: photoURL, applicationActivities: nil)
            
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.message]
            activityVC.popoverPresentationController?.sourceView = UIView()
            
            self.present(activityVC, animated: true, completion: nil)
        }
    }
}
