//
//  MockHandler.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 21/11/2022.
//

import Foundation

struct MockHandler<T: Codable> {
    func getMockModel(jsonFileName: String) -> T? {
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let model = try decoder.decode(T.self, from: data)
                return model
            } catch {
                print(error)
            }
        }
        
        return nil
    }
}
