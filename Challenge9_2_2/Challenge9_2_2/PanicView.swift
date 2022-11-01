import UIKit

protocol PanicViewDelegate: AnyObject {
  func panic(_ sender: PanicView)
  func noPanic(_ sender: PanicView)
}

final class PanicView: UIView {
  weak var delegate: PanicViewDelegate?
  
  private enum ViewMetrics {
    static let fontSize: CGFloat = 24.0
    static let spacing: CGFloat = 16.0
  }
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [noPanicButton, panicButton])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = ViewMetrics.spacing
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  private lazy var noPanicButton: UIButton = {
    let title = NSLocalizedString("Don't Panic", comment: "Don't Panic")
    let button = UIButton.makeButton(title: title, color: .green, fontSize: ViewMetrics.fontSize)
    button.addTarget(self, action: #selector(noPanic(_:)), for: .touchUpInside)
    return button
  }()
  
  private lazy var panicButton: UIButton = {
    let title = NSLocalizedString("Panic", comment: "Panic")
    let button = UIButton.makeButton(title: title, color: .red, fontSize: ViewMetrics.fontSize)
    button.addTarget(self, action: #selector(panic(_:)), for: .touchUpInside)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let minButtonWidth = max(noPanicButton.intrinsicContentSize.width, panicButton.intrinsicContentSize.width)
    
    let minHorizontalWidth = minButtonWidth * 2 + ViewMetrics.spacing
    
    let marginWidth = layoutMarginsGuide.layoutFrame.width
    
    if minHorizontalWidth > marginWidth {
      stackView.axis = .vertical
    } else {
      stackView.axis = .horizontal
    }
  }
  
  private func setupView() {
    addSubview(stackView)
    NSLayoutConstraint.activate([
      layoutMarginsGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
      layoutMarginsGuide.topAnchor.constraint(equalTo: stackView.topAnchor),
      layoutMarginsGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
      layoutMarginsGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
    ])
  }
  
  @objc private func panic(_ sender: UIButton) {
    delegate?.panic(self)
  }
  
  @objc private func noPanic(_ sender: UIButton) {
    delegate?.noPanic(self)
  }
}

extension UIButton {
  static func makeButton(title: String, color: UIColor, fontSize: CGFloat) -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
    button.setTitleColor(.black, for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    button.backgroundColor = color
    return button
  }
}
