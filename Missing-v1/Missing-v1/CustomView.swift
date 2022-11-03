//
//  CustomView.swift
//  Missing-v1
//
//  Created by Андрей Антонен on 01.11.2022.
//

import UIKit

final class CustomView: UIView {

  private enum ViewMetrics {
    static let fontSize: CGFloat = 24.0
    static let backgroundColor: UIColor = .yellow
    static let spacing: CGFloat = 16.0
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
    setupConstraints()
  }
  
  private lazy var okButton: UIButton = {
    let title = NSLocalizedString("OK", comment: "Cancel")
    let button = UIButton.makeButton(title: title, fontSize: ViewMetrics.fontSize, titleColor: .black, backgroundColor: .green)
    button.accessibilityIdentifier = "cancelButton"
    return button
  }()
  
  private lazy var cancelButton: UIButton = {
    let title = NSLocalizedString("Cancel", comment: "Cancel")
    let button = UIButton.makeButton(title: title, fontSize: ViewMetrics.fontSize, titleColor: .black, backgroundColor: .red)
    button.accessibilityIdentifier = "okButton"
    return button
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [cancelButton, okButton])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = ViewMetrics.spacing
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  private func setupView() {
    addSubview(stackView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
    ])
  }
}

private extension UIButton {
  static func makeButton(title: String, fontSize: CGFloat, titleColor: UIColor, backgroundColor: UIColor) -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
    button.setTitleColor(titleColor, for: .normal)
    button.backgroundColor = backgroundColor
    return button
  }
}
