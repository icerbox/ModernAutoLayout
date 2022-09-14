import UIKit

private extension UIImageView {
  convenience init(named name: String, backgroundColor: UIColor) {
    self.init(image: UIImage(named: name))
    self.backgroundColor = backgroundColor
    translatesAutoresizingMaskIntoConstraints = false
  }
}

class ViewController: UIViewController {
  
  private let sunView = UIImageView(named: "sun", backgroundColor: .orange)
  private let snowView = UIImageView(named: "snow", backgroundColor: .blue)
  
  private let captionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "This label should be below the tallest of the two images"
    label.font = UIFont.systemFont(ofSize: 32.0)
    label.numberOfLines = 0
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupConstraints()
    
  }
  
  
  private func setupView() {
    view.addSubview(sunView)
    view.addSubview(snowView)
    view.addSubview(captionLabel)
  }
  
  private func setupConstraints() {
    let margins = view.layoutMarginsGuide
    let captionTopConstraint = captionLabel.topAnchor.constraint(equalTo: margins.topAnchor)
    captionTopConstraint.priority = .defaultLow
    NSLayoutConstraint.activate([
      sunView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
      sunView.topAnchor.constraint(equalTo: margins.topAnchor),
      
      snowView.topAnchor.constraint(equalTo: margins.topAnchor),
      snowView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
      
      captionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
      captionLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
      
      captionLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: sunView.bottomAnchor, multiplier: 1.0),
      captionLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: snowView.bottomAnchor, multiplier: 1.0),
      
      captionLabel.topAnchor.constraint(greaterThanOrEqualTo: sunView.bottomAnchor, constant: 8.0),
      captionLabel.topAnchor.constraint(greaterThanOrEqualTo: snowView.bottomAnchor, constant: 8.0),
      
      captionTopConstraint
      
    ])
  }
}

