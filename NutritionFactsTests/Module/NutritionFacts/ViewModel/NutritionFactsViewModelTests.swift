//
//  NutritionFactsViewModelTests.swift
//  NutritionFactsTests
//
//  Created by Ahmad Ragab on 21/11/2022.
//

import XCTest
@testable import NutritionFacts

class NutritionFactsViewModelTests: XCTestCase, NutritionFactsViewModelDelegate {
    
    var successMockUseCase: NutritionFactsUseCaseProtocol = NutritionFactsUseCaseSuccessMock()
    var failMockUseCase: NutritionFactsUseCaseProtocol = NutritionFactsUseCaseFailedMock()
    var viewModel: NutritionFactsViewModel?
    var factsModel: FactsModel?
    var error: String?

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
    
    func test_SuccessMock() {
        viewModel = NutritionFactsViewModel(useCase: successMockUseCase)
        XCTAssertNotNil(viewModel)
        
        viewModel!.delegate = self
        viewModel!.getFactsById(1)
        
        XCTAssertNotNil(factsModel)
        XCTAssert(factsModel!.title == "Ricotta cheese")
    }
    
    func test_FailMock() {
        viewModel = NutritionFactsViewModel(useCase: failMockUseCase)
        XCTAssertNotNil(viewModel)
        
        viewModel!.delegate = self
        viewModel!.getFactsById(123123)
        
        XCTAssertNotNil(error)
        XCTAssert(error != "")
    }
    
    func getFactsSuccess(facts: FactsModel) {
        self.factsModel = facts
    }
    
    func getFactsFailed(error: String) {
        self.error = error
    }
}

