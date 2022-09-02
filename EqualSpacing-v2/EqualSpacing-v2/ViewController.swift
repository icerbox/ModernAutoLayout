import UIKit

final class ViewController: UIViewController {
  
  private lazy var cancelButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .red
    return button
  }()
  private lazy var okButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .green
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.addSubview(cancelButton)
    view.addSubview(okButton)
    
    let leadingGuide = UILayoutGuide()
    let middleGuide = UILayoutGuide()
    let trailingGuide = UILayoutGuide()
    
    view.addLayoutGuide(leadingGuide)
    view.addLayoutGuide(middleGuide)
    view.addLayoutGuide(trailingGuide)
    
    NSLayoutConstraint.activate([
      view.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor),
      leadingGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor),
      
      cancelButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor),
      middleGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor),
      
      okButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor),
      trailingGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      cancelButton.widthAnchor.constraint(equalTo: okButton.widthAnchor),
      
      leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor),
      leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor),
      
      cancelButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      okButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
    ])
  }

}

