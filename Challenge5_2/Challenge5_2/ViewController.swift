import UIKit

final class ViewController: UIViewController {
  
  private let tileView: TileView = {
    let view = TileView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .yellow
    view.addSubview(tileView)
    
    NSLayoutConstraint.activate([
      tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tileView.topAnchor.constraint(equalTo: view.topAnchor),
      tileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

}

