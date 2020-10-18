//
//  StorageServiceSecond.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 18.10.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation
import RealmSwift

class BreedRealm: Object {
    @objc dynamic var breed: String = ""
    var image = List<BreedImageRealm>()
    
    override static func primaryKey() -> String? {
        return "breed"
    }
}

class BreedImageRealm: Object {
    @objc dynamic var imageURL: String = ""
    
    override static func primaryKey() -> String? {
        return "imageURL"
    }
}

class StorageServiceSecond {
    
    static var shared = StorageServiceSecond()
    private var realm: Realm
    
    init() {
        guard let realm = try? Realm() else {
            fatalError() }
        self.realm = realm
    }
    
    func saveDogBreed(_ name: String, _ photoURL: String) {
        try! realm.write {
        let photoURLString = photoURL
        if let newBreed = realm.objects(BreedRealm.self).filter("breed == '\(name)'").first {
           
                let newImageURL = BreedImageRealm()
                newImageURL.imageURL = photoURLString
                newBreed.image.append(newImageURL)
                realm.add(newBreed)
            
        } else {
            
                let newBreed = BreedRealm()
                newBreed.breed = name
                let newImageURL = BreedImageRealm()
                newImageURL.imageURL = photoURLString
                newBreed.image.append(newImageURL)
                realm.add(newBreed)
            
        }
        
        realm.refresh()
        }
    }
    
    func readModel() -> [BreedRealm]? {
        
        let object: [BreedRealm]?
        
        object = realm.objects(BreedRealm.self).filter("#image.@count > 0").array
        
        return object
    }
    
    func readImage(imageURL: String) -> Bool {
        
        if realm.objects(BreedImageRealm.self).filter("imageURL == '\(imageURL)'").count == 0 {
            return false
        } else {
            return true
        }
    }
    
    func deleteModel(imageURL: String) {
        guard let record = realm.objects(BreedImageRealm.self).filter("imageURL == '\(imageURL)'").first else { return }
        try? realm.write {
            realm.delete(record)
            realm.refresh()
        }
    }
    
}


extension List {
    var array: [Element] {
        return self.count > 0 ? self.map { $0 } : []
    }
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}

extension Results {
    var array: [Element] {
        return self.count > 0 ? self.map { $0 } : []
    }
}
