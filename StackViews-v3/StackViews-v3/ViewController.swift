
import UIKit

private extension UIButton {
  static func customButton(title: String, color: UIColor, fontSize: CGFloat) -> UIButton {
    let button = UIButton(type: .custom)
    button.setTitle(title, for: .normal)
    button.setTitleColor(color, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
    return button
  }
}

class ViewController: UIViewController {
  
  private enum ViewMetrics {
    static let fontSize: CGFloat = 24.0
    static let spacing: CGFloat = 16.0
  }
  
  private let redButton = UIButton.customButton(title: "Red", color: .red, fontSize: ViewMetrics.fontSize)
  private let greenButton = UIButton.customButton(title: "Green", color: .green, fontSize: ViewMetrics.fontSize)
  private let blueButton = UIButton.customButton(title: "Blue", color: .blue, fontSize: ViewMetrics.fontSize)
  
  private lazy var buttonStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
    stackView.spacing = ViewMetrics.spacing
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  private lazy var rootStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [colorLabel, buttonStackView])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = ViewMetrics.spacing
    return stackView
  }()
  
  private let colorLabel: UILabel = {
    let label = UILabel()
    label.text = "Pick a color"
    label.font = UIFont.systemFont(ofSize: ViewMetrics.fontSize)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.addSubview(rootStackView)
    NSLayoutConstraint.activate([
      rootStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      rootStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
    ])
  }

}

