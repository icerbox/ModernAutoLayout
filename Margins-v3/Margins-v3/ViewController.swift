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
  
  private let margin: CGFloat = 50.0
  
  private let nestedView: NestedView = {
    let view = NestedView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.preservesSuperviewLayoutMargins = true
    view.backgroundColor = .red
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .yellow
    view.addSubview(nestedView)
    changeNestedMargins(inset: margin)
  }
  
  private func changeNestedMargins(inset: CGFloat) {
    if #available(iOS 11, *) {
      nestedView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
    } else {
      nestedView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      nestedView.leadingAnchor.constraint(equalTo: safeLeadingAnchor),
      nestedView.trailingAnchor.constraint(equalTo: safeTrailingAnchor),
      nestedView.topAnchor.constraint(equalTo: safeTopAnchor),
      nestedView.bottomAnchor.constraint(equalTo: safeBottomAnchor)
    ])
  }
  
}

