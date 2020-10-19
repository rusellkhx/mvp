//
//  Breeds.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 06.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation
import RealmSwift

struct Breed: Codable {
    let message: [String: [String]]
    let status: String
    
    /*init?(message: [String: [String]], status: String) {
        self.message = message
        self.status = status
    }*/
}

struct SubBreeeds: Codable {
    let message: [String]
    let status: String
}

struct ImageBreed: Codable {
    let status: String
    let message: [String]
}

public class ImageModel {
    
    var url: URL
    var isFavorite: Bool
    
    init(url: URL, isFavorite: Bool) {
        self.url = url
        self.isFavorite = isFavorite
    }
}

public class DogModel {
    
    var breed: String
    var subbreed: [String]
    
    init(breed: String, subbreed: [String]) {
        self.breed = breed
        self.subbreed = subbreed
    }
}



