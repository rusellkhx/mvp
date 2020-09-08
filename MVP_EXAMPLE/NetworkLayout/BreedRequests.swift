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
        let url = baseUrl
        http.queryByApiKey(url, queue: .defaultQos) { (data, error) in
            self.response(data, error, modelCls: Breed.self, resp: resp)
        }
    }
}

