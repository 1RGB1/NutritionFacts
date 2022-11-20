//
//  FactsModel.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

struct FactsModel: BaseModel {
    let title: String
    let calories: Int
    let carbs: Float
    let protein: Float
    let fat: Float
    let saturatedfat: Float
    let unsaturatedfat: Float
    let fiber: Float
    let cholesterol: Float
    let sugar: Float
    let sodium: Float
    let potassium: Float
    let gramsperserving: Float
    let pcstext: String
}
