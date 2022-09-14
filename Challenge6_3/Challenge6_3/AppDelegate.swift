import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    let rootViewController = ViewController()
    rootViewController.title = NSLocalizedString("Title", comment: "Title")
    let navigationController = UINavigationController(rootViewController: rootViewController)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    return true
  }
}

