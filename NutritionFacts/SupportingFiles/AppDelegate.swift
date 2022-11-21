//
//  AppDelegate.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setIntialViewController()
        return true
    }
}

extension AppDelegate {
    private func setIntialViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = NutritionFactsViewController()
        self.window?.makeKeyAndVisible()
    }
}

