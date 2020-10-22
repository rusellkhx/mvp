//
//  ImageViewCell.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 11.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit
import Kingfisher

protocol ImageViewCellProtocol {
    func configureCell(imageURL: String?, isFavourite: Bool)
}


class BaseCell: UICollectionViewCell {

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    func setupViews() {
    }
}

class ImageViewCell: BaseCell {
    
    @IBOutlet weak var breedImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func setupViews() {
        
        addSubview(breedImageView)
        addSubview(likeButton)
        breedImageView.contentMode = .center
        breedImageView.contentMode = .scaleAspectFit
        breedImageView.clipsToBounds = true
    }
}

extension ImageViewCell: ImageViewCellProtocol {
    func configureCell(imageURL: String?, isFavourite: Bool) {
        activityIndicator.startAnimating()
        breedImageView.image = nil
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = imageURL else { return }
            do {
                //let image = UIImage(data: try Data(contentsOf: url))
                DispatchQueue.main.async {
                    if isFavourite {
                        self.likeButton.tintColor = .red
                        print("---\(isFavourite)")
                        self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                    } else {
                        self.likeButton.tintColor = .black
                        self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
                        //print("---\(isFavourite)")
                    }
                    self.breedImageView.kf.setImage(with: URL(string: url), placeholder: UIImage(named: ""))
                    //self.breedImageView.image = image
                    self.activityIndicator.stopAnimating()
                }
            } catch { }
        }
    }

}

