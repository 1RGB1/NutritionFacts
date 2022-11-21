//
//  NutritionFactsUseCase.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation

protocol NutritionFactsUseCaseProtocol {
    func getFactsById(_ id: Int, completionHandler: @escaping (Result<FactsModel, NetworkError>) -> Void)
}

struct NutritionFactsUseCase: NutritionFactsUseCaseProtocol {
    
    var factsStore: NutritionFactsStoreProtocol
    
    init(factsStore: NutritionFactsStoreProtocol = NutritionFactsStore()) {
        self.factsStore = factsStore
    }
    
    /// To find git repos
    /// - Parameters:
    ///   - id:  for getting ingredient's nutrition facts by id
    ///   - completionHandler: clouser that constains error in case of failure and object in case of success
    func getFactsById(_ id: Int, completionHandler: @escaping (Result<FactsModel, NetworkError>) -> Void) {
        factsStore.getFactsById(id) { (result: Result<NutritionModel, NetworkError>) in
            switch result {
            case .success(let model):
                if let response = model.response {
                    completionHandler(.success(response))
                } else {
                    completionHandler(.failure(NetworkError.genericError()))
                }
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
