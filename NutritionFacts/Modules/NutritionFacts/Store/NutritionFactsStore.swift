//
//  NutritionFactsStore.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation

protocol NutritionFactsStoreProtocol {
    func getFactsById(_ id: Int, completionHandler: @escaping (Result<NutritionModel, NetworkError>) -> Void)
}

struct NutritionFactsStore: NutritionFactsStoreProtocol {
    
    /// To find git repos
    /// - Parameters:
    ///   - id:  for getting ingredient's nutrition facts by id
    ///   - completionHandler: clouser that constains error in case of failure and object in case of success
    func getFactsById(_ id: Int, completionHandler: @escaping (Result<NutritionModel, NetworkError>) -> Void) {
        let factsRouter = FactsRouter.getFacts(id)
        NetworkManager.shared.getData(request: factsRouter) { result in
            completionHandler(result)
        }
    }
}
