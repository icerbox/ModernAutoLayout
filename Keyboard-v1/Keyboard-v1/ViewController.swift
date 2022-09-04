import UIKit

final class ViewController: UIViewController {
  
  private lazy var toolbar: Toolbar = {
    let toolbar = Toolbar()
    toolbar.translatesAutoresizingMaskIntoConstraints = false
    return toolbar
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.addSubview(toolbar)
    NSLayoutConstraint.activate([
      toolbar.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
      toolbar.centerXAnchor.constraint(equalTo: view.keyboardLayoutGuide.centerXAnchor)
    ])
    let awayFromTop = toolbar.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)
    awayFromTop.identifier = "KB-awayFromTop"
    view.keyboardLayoutGuide.setConstraints([awayFromTop], activeWhenAwayFrom: .top)
    
    let nearTop = toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    nearTop.identifier = "KB-neartop"
    view.keyboardLayoutGuide.setConstraints([nearTop], activeWhenAwayFrom: .top)
    
    let inMiddle = toolbar.centerXAnchor.constraint(equalTo: view.keyboardLayoutGuide.centerXAnchor)
    inMiddle.identifier = "KB-inMiddle"
    view.keyboardLayoutGuide.setConstraints([inMiddle], activeWhenAwayFrom: [.leading, .trailing])
    
    let nearLeading = toolbar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
    nearLeading.identifier = "KB-nearLeading"
    view.keyboardLayoutGuide.setConstraints([nearLeading], activeWhenAwayFrom: .leading)
    
    let nearTrailing = toolbar.trailingAnchor.constraint(equalTo: view.keyboardLayoutGuide.trailingAnchor)
    nearTrailing.identifier = "KB-nearTrailing"
    view.keyboardLayoutGuide.setConstraints([nearTrailing], activeWhenAwayFrom: .trailing)
    
  }

  
}

