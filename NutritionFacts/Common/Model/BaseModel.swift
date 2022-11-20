//
//  BaseModel.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation

protocol BaseModel: Codable {}

protocol ResponseModel: Codable {
    var meta: MetaModel { get set }
}
