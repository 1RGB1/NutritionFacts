//
//  NutritionFactsUseCaseFailedMock.swift
//  NutritionFactsTests
//
//  Created by Ahmad Ragab on 21/11/2022.
//

import Foundation
@testable import NutritionFacts

class NutritionFactsUseCaseFailedMock: NutritionFactsUseCaseProtocol {
    func getFactsById(_ id: Int, completionHandler: @escaping (Result<FactsModel, NetworkError>) -> Void) {
        if let model: NutritionModel = MockHandler().getMockModel(jsonFileName: "NutritionFactsFailedMockModel") {
            completionHandler(.failure(NetworkError(errorMsg: model.meta.errorDetail ?? "")))
        } else {
            completionHandler(.failure(NetworkError(errorMsg: ErrorType.genericError.rawValue)))
        }
    }
}
