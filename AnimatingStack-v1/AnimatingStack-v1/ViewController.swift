import UIKit

public extension UIStackView {
  @discardableResult
  func addUnarrangedView(color: UIColor, radius: CGFloat = 0, at index: Int = 0) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    view.layer.cornerRadius = radius
    insertSubview(view, at: index)
    NSLayoutConstraint.activate([
      view.leadingAnchor.constraint(equalTo: leadingAnchor),
      view.trailingAnchor.constraint(equalTo: trailingAnchor),
      view.topAnchor.constraint(equalTo: topAnchor),
      view.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    return view
  }
  @discardableResult
  func addBackGround(color: UIColor, radius: CGFloat = 0) -> UIView {
    return addUnarrangedView(color: color, radius: radius, at: 0)
  }
  
  @discardableResult
  func addForeground(color: UIColor, radius: CGFloat = 0) -> UIView {
    let index = subviews.count
    return addUnarrangedView(color: color, radius: radius, at: index)
  }
}

class ViewController: UIViewController {
  
  @IBOutlet weak var containerStackView: UIStackView!
  @IBOutlet weak var imageStackVIew: UIStackView!
  @IBOutlet weak var axisSwitch: UISwitch!
  
  @IBAction func axisChanged(_ sender: Any) {
    let animator = UIViewPropertyAnimator(duration: 2.0, dampingRatio: 0.2, animations: {
      self.configureAxis()
    })
    animator.startAnimation()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureAxis()
    setupView()
  }
  
  private func configureAxis() {
    imageStackVIew?.axis = axisSwitch.isOn ? .vertical : .horizontal
    if let lastImageView = imageStackVIew.arrangedSubviews.last {
      lastImageView.isHidden = !axisSwitch.isOn
    }
  }
  private func setupView() {
//    let backgroundView = UIView()
//    backgroundView.translatesAutoresizingMaskIntoConstraints = false
//    backgroundView.backgroundColor = .purple
//    backgroundView.layer.cornerRadius = 10.0
//    containerStackView.insertSubview(backgroundView, at: 0)
    containerStackView.addBackGround(color: .purple, radius: 10.0)
//
//    NSLayoutConstraint.activate([
//      containerStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
//      containerStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
//      containerStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
//      containerStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
//    ])
  }
}

