//
//  ImageViewCell.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 11.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit

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
    
    override func setupViews() {
        
        addSubview(breedImageView)
        addSubview(likeButton)
        breedImageView.contentMode = .center
        breedImageView.contentMode = .scaleAspectFill
        breedImageView.clipsToBounds = true
        
    }
}

