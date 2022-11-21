////
//  NutritionFactsViewController.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import UIKit
import ProgressHUD

class NutritionFactsViewController: UIViewController {
    
    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var ingredientLabel: UILabel!
    @IBOutlet private weak var moreInfoButton: UIButton!
    @IBOutlet private weak var carbsLabel: UILabel!
    @IBOutlet private weak var proteinLabel: UILabel!
    @IBOutlet private weak var fatLabel: UILabel!
    
    let viewModel = NutritionFactsViewModel()
    var randomId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        
        prepareUI()
        getFacts()
    }
    
    fileprivate func prepareUI() {
        prepareIngredientView()
        prepareMoreButton()
    }
    
    fileprivate func prepareIngredientView() {
        gradientView.applyGradient(colors: UIColor.ingredientGradient)
        gradientView.setCornerRadius(cornerRadius: gradientView.frame.size.height / 2)
        gradientView.setShadow(color: UIColor.ingredientShadow, offset: CGSize(width: 0, height: 8), opacity: 0.33, blur: 24, spread: 0)
    }
    
    fileprivate func prepareMoreButton() {
        moreInfoButton.applyGradient(colors: UIColor.moreGradient)
        moreInfoButton.setTitle("MORE INFO", for: .normal)
        moreInfoButton.setTitleColor(.white, for: .normal)
        moreInfoButton.setCornerRadius(cornerRadius: moreInfoButton.frame.size.height / 2)
        moreInfoButton.setShadow(color: UIColor.moreShadow, offset: CGSize(width: 0, height: 16), opacity: 0.33, blur: 27, spread: 0)
    }
    
    fileprivate func handleSuccessState() {
        ProgressHUD.dismiss()
        ProgressHUD.colorStatus = .systemBlue
        ProgressHUD.show(icon: .succeed)
    }
    
    fileprivate func handleFailureState(_ error: String) {
        ProgressHUD.colorStatus = .systemRed
        ProgressHUD.showError(error, image: nil, interaction: true)
    }
    
    fileprivate func prepareIngredientLabel(name: String, calories: Int) {
        
        let text = NSMutableAttributedString()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        
        text.append(
            NSAttributedString(
                string: name.uppercased(),
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 20)!,
                    NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue
                ]
            )
        )
        text.append(
            NSAttributedString(
                string: "\n",
                attributes: [
                    NSAttributedString.Key.font: UIFont(name: "Avenir-Light", size: 1)!
                ]
            )
        )
        text.append(
            NSAttributedString(
                string: "\(calories)",
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 60)!
                ]
            )
        )
        text.append(
            NSAttributedString(
                string: "\n",
                attributes: [
                    NSAttributedString.Key.font: UIFont(name: "Avenir-Light", size: 1)!
                ]
            )
        )
        text.append(
            NSAttributedString(
                string: "Calories per serving",
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 20)!
                ]
            )
        )
        
        ingredientLabel.attributedText = text
        ingredientLabel.textAlignment = .center
    }
    
    fileprivate func updateFacts(_ facts: FactsModel) {
        prepareIngredientLabel(name: facts.title, calories: facts.calories)
        fillFactsInfo(carbs: facts.carbs, protein: facts.protein, fat: facts.fat)
    }
    
    fileprivate func fillFactsInfo(carbs: Float, protein: Float, fat: Float) {
        carbsLabel.text = "\(carbs) %"
        proteinLabel.text = "\(protein) %"
        fatLabel.text = "\(fat) %"
    }
    
    @IBAction func moreInfoTapped(_ sender: Any) {
        getFacts()
    }
    
    fileprivate func getFacts() {
        var tmp = Int.random(in: 1..<201)
        while randomId == tmp {
            tmp = Int.random(in: 1..<201)
        }
        randomId = tmp
        viewModel.getFactsById(randomId)
    }
}

extension NutritionFactsViewController: NutritionFactsViewModelDelegate {
    func getFactsSuccess(facts: FactsModel) {
        updateFacts(facts)
        handleSuccessState()
    }
    
    func getFactsFailed(error: String) {
        handleFailureState(error)
    }
}
