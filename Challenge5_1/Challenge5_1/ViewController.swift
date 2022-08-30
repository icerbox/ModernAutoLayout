import UIKit

private extension UIView {
  static func makeView(color: UIColor) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    return view
  }
}

class ViewController: UIViewController {

  private let padding: CGFloat = 50.0
  private let spacing: CGFloat = 25.0
  
  private let greenView = UIView.makeView(color: .green)
  private let redView = UIView.makeView(color: .red)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupConstraints()
  }
  
  private func setupView() {
    view.backgroundColor = .yellow
    view.addSubview(greenView)
    view.addSubview(redView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      view.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: padding),
      greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
      view.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: padding),
      redView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor,constant: spacing),
      greenView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: spacing),
      
      redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
      redView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
}

