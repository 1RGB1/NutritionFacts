//
//  MetaModel.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation

struct MetaModel: Codable {
    let code: Int
    let errorType: String?
    let errorDetail: String?
}
