//
//  ImageViewCell.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 11.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    func setupView() { }
}

class ImageViewCell: Cell {
    
    @IBOutlet weak var conView: UIView!
    @IBOutlet weak var breedImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func setupView() {
        addSubview(conView)
        addSubview(likeButton)
        breedImageView.contentMode = .scaleAspectFill
        breedImageView.clipsToBounds = true
        
    }
}
