import UIKit

class ViewController: UIViewController {
  
  private enum ViewMetrics {
    static let nameFontSize: CGFloat = 18.0
    static let bioFontSize: CGFloat = 17.0
    static let margin: CGFloat = 20.0
  }
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: ViewMetrics.nameFontSize)
    label.numberOfLines = 0
    label.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
    label.textColor = .blue
    return label
  }()
  
  private let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .top
    imageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
    return imageView
  }()
  
  private let bioLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: ViewMetrics.bioFontSize)
    label.numberOfLines = 0
    return label
  }()
  
  private lazy var labelStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [nameLabel, bioLabel])
    stackView.axis = .vertical
    stackView.spacing = UIStackView.spacingUseSystem
    return stackView
  }()
  
  private lazy var profileStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [profileImageView, labelStackView])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = UIStackView.spacingUseSystem
    return stackView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: ViewMetrics.margin, leading: ViewMetrics.margin, bottom: ViewMetrics.margin, trailing: ViewMetrics.margin)
    view.addSubview(profileStackView)
    setupView()
  }
  
  private func setupView() {
    
    let margin = view.layoutMarginsGuide
    NSLayoutConstraint.activate([
      profileStackView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
      profileStackView.topAnchor.constraint(equalTo: margin.topAnchor),
      profileStackView.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
    ])
  }

}

