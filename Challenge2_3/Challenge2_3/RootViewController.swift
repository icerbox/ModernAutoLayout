import UIKit

final class RootViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func loadView() {
      let rootView = RGBView()
      view = rootView
      }

}

