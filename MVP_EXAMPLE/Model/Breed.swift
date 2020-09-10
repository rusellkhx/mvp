//
//  Breeds.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 06.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation

struct Breed: Codable {
    let message: [String: [String]]
    let status: String
    
    init?(message: [String: [String]], status: String) {
        self.message = message
        self.status = status
    }
}


struct SubBreeeds: Codable {
    let message: [String]
    let status: String
}

struct Image: Codable {
    let status: String
    let message: [String]
}

/*class Dog: Object {
 @objc dynamic var breed: String? = nil
 @objc dynamic var image: String? = nil
 @objc dynamic var hasFavourited: Bool = false
 }*/
