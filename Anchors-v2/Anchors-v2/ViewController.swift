import UIKit

extension UIView {
  static func makeView(color: UIColor) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    return view
  }
}

final class ViewController: UIViewController {
  private let stopGoView: StopGoView = {
    let view = StopGoView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .yellow
    return view
  }()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .yellow
    view.addSubview(stopGoView)
    
    NSLayoutConstraint.activate([
      stopGoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      stopGoView.topAnchor.constraint(equalTo: view.topAnchor),
      stopGoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      stopGoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

}

