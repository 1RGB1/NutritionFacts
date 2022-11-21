//
//  NutritionFactsViewModel.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation

protocol NutritionFactsViewModelDelegate: AnyObject {
    func getFactsSuccess(facts: FactsModel)
    func getFactsFailed(error: String)
}

class NutritionFactsViewModel {
    
    private var useCase: NutritionFactsUseCaseProtocol
    weak var delegate: NutritionFactsViewModelDelegate?
    
    init(useCase: NutritionFactsUseCaseProtocol = NutritionFactsUseCase()) {
        self.useCase = useCase
    }
    
    func getFactsById(_ id: Int) {
        useCase.getFactsById(id) { [weak self] (result: Result<FactsModel, NetworkError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let model):
                self.delegate?.getFactsSuccess(facts: model)
                
            case .failure(let error):
                self.delegate?.getFactsFailed(error: error.errorMsg)
            }
        }
    }
 }
