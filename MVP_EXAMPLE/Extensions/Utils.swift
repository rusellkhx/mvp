//
//  Utils.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 20.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let leftDistanceToView: CGFloat = 25
    static let rightDistanceToView: CGFloat = 25
    static let galleryMinimumLineSpacing: CGFloat = 100
    //вычисление ширины ячейки
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}


