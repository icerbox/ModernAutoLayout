import UIKit

extension UIImageView {
  convenience init(named name: String, top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
    let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    let originalImage = UIImage(named: name)
    let insetImage = originalImage?.withAlignmentRectInsets(insets)
    self.init(image: insetImage)
  }
}

final class ViewController: UIViewController {
  
  private lazy var tileView: TileView = {
    let view = TileView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .gray
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .yellow
    view.addSubview(tileView)
    let guide = view.layoutMarginsGuide
    NSLayoutConstraint.activate([
      tileView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      tileView.centerYAnchor.constraint(equalTo: guide.centerYAnchor)
    ])
  }

}

