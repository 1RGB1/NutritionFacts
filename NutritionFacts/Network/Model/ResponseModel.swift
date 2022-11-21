//
//  ResponseModel.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 21/11/2022.
//

import Foundation

protocol ResponseModel: Codable {
    var meta: MetaModel { get set }
}
