//
//  BreedRequests.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 06.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation
import Alamofire

class BreedRequests: RestClient {
    
    func getBreed(resp: @escaping IdResponseBlock) {
        let url = baseUrl + Requests.prefixUrlListAll
        http.queryByApiKey(url, queue: .defaultQos) { (data, error) in
            self.response(data, error, modelCls: Breed.self, resp: resp)
        }
    }
    
    func getSubBreeds(breed: String, resp: @escaping IdResponseBlock) {
        let url = baseUrl + "breed/" + breed + "/list"
        print(url)
        http.queryByApiKey(url, queue: .defaultQos) { (data, error) in
            self.response(data, error, modelCls: SubBreeeds.self, resp: resp)
        }
    }
    
    func getSubBreedImages(breed: String, resp: @escaping IdResponseBlock) {
        let url = baseUrl + "breed/" + breed + "/images"
        print(url)
        http.queryByApiKey(url, queue: .defaultQos) { (data, error) in
            self.response(data, error, modelCls: ImageBreed.self, resp: resp)
        }
    }
    
}

