//
//  ImageViewCell.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 11.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit
import Kingfisher

class BaseCell: UICollectionViewCell {

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    func setupViews() {
    }
}

class ImageViewCell: BaseCell {
    
    @IBOutlet weak var conView: UIView!
    @IBOutlet weak var breedImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func setupViews() {
        
        addSubview(breedImageView)
        addSubview(likeButton)
        breedImageView.contentMode = .center
        breedImageView.clipsToBounds = true
        
    }
    
}

