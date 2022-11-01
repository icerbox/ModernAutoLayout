//
//  AppDelegate.swift
//  Layout-v1
//
//  Created by Андрей Антонен on 19.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = PreviewViewController()
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
    return true
  }

  

}

