import UIKit

extension UIViewController {
  var safeTopAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11, *) {
      return view.safeAreaLayoutGuide.topAnchor
    } else {
      return topLayoutGuide.bottomAnchor
    }
  }
  
  var safeBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11, *) {
      return view.safeAreaLayoutGuide.bottomAnchor
    } else {
      return bottomLayoutGuide.topAnchor
    }
  }
  
  var safeLeadingAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11, *) {
      return view.safeAreaLayoutGuide.leadingAnchor
    } else {
      return view.leadingAnchor
    }
  }
  
  var safeTrailingAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11, *) {
      return view.safeAreaLayoutGuide.trailingAnchor
    } else {
      return view.trailingAnchor
    }
  }
}

final class ViewController: UIViewController {
  
  let margin: CGFloat = 50.0

  private let tileView: TileView = {
    let view = TileView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .yellow
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupConstraints()
    changeNestedMargins(inset: margin)
  }
  
  private func setupView() {
    view.backgroundColor = .yellow
    view.addSubview(tileView)
    print(view.heightAnchor)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      tileView.leadingAnchor.constraint(equalTo: safeLeadingAnchor),
      tileView.topAnchor.constraint(equalTo: safeTopAnchor),
      tileView.trailingAnchor.constraint(equalTo: safeTrailingAnchor),
      tileView.bottomAnchor.constraint(equalTo: safeBottomAnchor)
      
    ])
  }
  
  private func changeNestedMargins(inset: CGFloat) {
    if #available(iOS 11, *) {
      tileView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
    } else {
      tileView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
  }

}

