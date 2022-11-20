//
//  NutritionFactsViewController.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import UIKit

class NutritionFactsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.getData(request: FactsRouter.getFacts(200)) { (result: Result<NutritionModel, NetworkError>) in
            switch result {
            case .success(let model):
                print(model)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
