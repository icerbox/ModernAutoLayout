import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    if #available(iOS 11, *) {
      viewRespectsSystemMinimumLayoutMargins = false
      view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
    }
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print(systemMinimumLayoutMargins)
  }
}

