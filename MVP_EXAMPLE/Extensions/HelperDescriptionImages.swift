//
//  HelperDescriptionImages.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 20.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation

struct HelperDescriptionImages {
    enum Message {
        //MARK: - HttpService
        static let noInternetConnection = "No internet connection!"
        static let serverEror = "Server error!"
        static let someServerError = "Some server error!"
        static let reqestError = "Reqest error"
        static let sharePhoto = "Share photo"
    }
    //MARK: - Navigation
    enum Navigation {
        static let titleBreeeds = "Breeds"
        static let titleSharePhoto = "square.and.arrow.up"
        static let titleFafavourites = "Favourites"
    }
    
    enum Action {
        static let Cancel = "Cancel"
        static let Share = "Share"
    }
}
