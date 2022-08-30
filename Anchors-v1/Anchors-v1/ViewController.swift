import UIKit

private extension UIView {
  static func makeView(color: UIColor) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    return view
  }
}

final class ViewController: UIViewController {
  
  private let padding: CGFloat = 50.0
  private let spacing: CGFloat = 25.0
  
  private let redView = UIView.makeView(color: .red)
  private let greenView = UIView.makeView(color: .green)

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .yellow
    view.addSubview(redView)
    view.addSubview(greenView)
    
    NSLayoutConstraint.activate([
      redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      
      view.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: padding),
      view.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: padding),
      
      redView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
      greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: spacing),
      view.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: padding),
      
      redView.heightAnchor.constraint(equalTo: greenView.heightAnchor)
    ])
  }

}

