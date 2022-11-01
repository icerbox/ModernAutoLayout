//
//  AppDelegate.swift
//  Challenge9_2_2
//
//  Created by Андрей Антонен on 28.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = RootViewController()
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
    return true
  }

}

