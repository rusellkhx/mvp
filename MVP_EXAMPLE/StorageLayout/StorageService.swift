//
//  StorageService.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 28.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    @objc dynamic var breed: String? = nil
    @objc dynamic var image: String? = nil
    @objc dynamic var hasFavourited: Bool = false
}

class StorageService {
    
    private var realm: Realm
    
    init() {
        guard let realm = try? Realm() else {
            fatalError()
        }
        
        self.realm = realm
    }
    
    func changePhotoStatus(_ name: String, _ photoURL: String) -> Bool {
        let photoURLString = photoURL
        let photo = realm.objects(Dog.self).filter({$0.image == photoURLString})
        if photo.isEmpty {
            try? realm.write {
                let dog = Dog()
                dog.breed = name
                dog.image = photoURLString
                dog.hasFavourited = true
                realm.add(dog)
            }
            
            return true
        } else {
            try? realm.write {
                realm.delete(photo)
            }
            
            return false
        }
    }
    
}
