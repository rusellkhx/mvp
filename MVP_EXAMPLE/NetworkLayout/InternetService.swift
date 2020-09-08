//
//  InternetService.swift
//  MVP_EXAMPLE
//
//  Created by Rusell on 02.09.2020.
//  Copyright © 2020 RusellKh. All rights reserved.
//

import Foundation
import Alamofire

class InternetService {
    
    private let net = NetworkReachabilityManager()
    
    static let shared = InternetService()
    var internetHandler: ((_ flag: Bool) -> Void)?
    
    private init() {}
    
    func start() {
        self.startNetworkReachabilityObserver()
    }
    
    private func startNetworkReachabilityObserver() {
        net?.startListening(onUpdatePerforming: { status in
            
            if self.net?.isReachable ?? false {
                
                if self.net?.isReachableOnEthernetOrWiFi != nil {
                    self.internetHandler?(true)
                } else if (self.net?.isReachableOnCellular)! {
                    self.internetHandler?(true)
                }
            } else {
                self.internetHandler?(false)
            }
        })
    }
    
    func checkInternetConnect() -> Bool {
        return net?.isReachable ?? false
    }
    
}
