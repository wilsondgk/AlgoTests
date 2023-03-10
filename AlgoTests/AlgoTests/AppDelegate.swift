//
//  AppDelegate.swift
//  AlgoTests
//
//  Created by Wilson Dong Gn Kim on 15/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UINavigationController(rootViewController: ProblemListVC(withProblems: AllStrategies.list))
        
        return true
    }
}

