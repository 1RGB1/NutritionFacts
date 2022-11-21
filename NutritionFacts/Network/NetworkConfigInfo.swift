//
//  NetworkConfigInfo.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation

enum NetworkConfigInfoType: Int {
    case baseURL
}

class NetworkConfigInfo {
    
    private init() {}
    
    static let shared: NetworkConfigInfo = {
        return NetworkConfigInfo()
    }()
    
    func getParam(withType type: NetworkConfigInfoType) -> String {
        switch type {
        case .baseURL:
            return getConfigValueForKey("BASE_URL")
        }
    }
    
    fileprivate func getConfigValueForKey(_ key: String) -> String {
        let configInfo = Bundle.main.infoDictionary
        return (configInfo?[key] as? String) ?? ""
    }
}
