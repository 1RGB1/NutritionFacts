//
//  NutritionFactsUseCaseSuccessMock.swift
//  NutritionFactsTests
//
//  Created by Ahmad Ragab on 21/11/2022.
//

import Foundation
@testable import NutritionFacts

class NutritionFactsUseCaseSuccessMock: NutritionFactsUseCaseProtocol {
    func getFactsById(_ id: Int, completionHandler: @escaping (Result<FactsModel, NetworkError>) -> Void) {
        if let model: NutritionModel = MockHandler().getMockModel(jsonFileName: "NutritionFactsSuccessMockModel") {
            if let response = model.response {
                completionHandler(.success(response))
            }
        } else {
            let error = NetworkError(errorMsg: ErrorType.genericError.rawValue)
            completionHandler(.failure(error))
        }
    }
}
