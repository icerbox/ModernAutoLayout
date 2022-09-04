import UIKit

class Toolbar: UIView {

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [favouriteButton, editButton, deleteButton])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 8.0
    stackView.distribution = .fillEqually
    stackView.backgroundColor = .systemGroupedBackground
    stackView.layer.cornerRadius = 10
    return stackView
  }()
  
  private lazy var favouriteButton: UIButton = {
    var config = UIButton.Configuration.plain()
    config.image = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
    let button = UIButton(configuration: config, primaryAction: UIAction { _ in
      print("Favourite")
    })
    return button
  }()
  
  private lazy var editButton: UIButton = {
    var config = UIButton.Configuration.plain()
    config.image = UIImage(systemName: "square.and.pencil", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
    let button = UIButton(configuration: config, primaryAction: UIAction { _ in
      print("Edit")
    })
    return button
  }()
  
  private lazy var deleteButton: UIButton = {
    var config = UIButton.Configuration.plain()
    config.image = UIImage(systemName: "trash", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
    let button = UIButton(configuration: config, primaryAction: UIAction { _ in
      print("Delete")
    })
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  private func setupView() {
    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
}
