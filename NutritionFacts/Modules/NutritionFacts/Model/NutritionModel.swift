//
//  NutritionModel.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation

struct NutritionModel: ResponseModel {
    var meta: MetaModel
    var response: FactsModel?
}
