//
//  NetworkManager.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation
import Alamofire

/// Singletone manager to handle all api calls
class NetworkManager {
    
    private init() {}
    
    static let shared: NetworkManager = {
        return NetworkManager()
    } ()
    
    /// To load data from api in a generic way
    /// - Parameters:
    ///   - request: request conforming base router combined with all required attributes for calling the api
    ///   - completionHandler: clouser that constains error in case of failure and object in case of success
    func getData<T: ResponseModel>(request: URLRequestConvertible, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        AF.request(request).response { [weak self] response in
            guard
                let self = self
            else {
                completionHandler(.failure(NetworkError(errorMsg: ErrorType.genericError.rawValue)))
                return
            }
            
            self.parseData(data: response.data) { result in
                completionHandler(result)
            }
        }
    }
    
    /// To parse response and data into observable
    /// - Parameters:
    ///   - response: response of api call
    ///   - data: returned data from api call in data object
    ///   - completionHandler: clouser that constains error in case of failure and object in case of success
    fileprivate func parseData<T: ResponseModel>(data: Data?, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard
            let data = data
        else {
            completionHandler(.failure(NetworkError(errorMsg: ErrorType.requestFailed.rawValue)))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(T.self, from: data)
            
            if model.meta.code != 200 {
                let networkError = NetworkError(errorMsg: model.meta.errorDetail ?? ErrorType.genericError.rawValue)
                completionHandler(.failure(networkError))
            } else {
                completionHandler(.success(model))
                return
            }
        } catch {
            let networkError = NetworkError(errorMsg: ErrorType.parsingFaild.rawValue)
            completionHandler(.failure(networkError))
        }
    }
}
