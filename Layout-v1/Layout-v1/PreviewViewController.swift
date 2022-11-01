import UIKit

final class PreviewViewController: UIViewController {
  private lazy var previewPane: PreviewPane = {
    let view = PreviewPane()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    refreshRandomViews()
  }
  
  private func setupView() {
    view.backgroundColor = .yellow
    view.addSubview(previewPane)
    
    let guide = view.layoutMarginsGuide
    NSLayoutConstraint.activate([
      previewPane.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      previewPane.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
      previewPane.trailingAnchor.constraint(equalTo: guide.trailingAnchor)
    ])
  }
  
  private let itemCount = 10
  
  
  
  private func refreshRandomViews() {
    var views = [UIView]()
    for count in 0..<itemCount {
      let view = UILabel()
      view.text = "\(count)"
      let size = CGFloat(arc4random_uniform(64)) + 64.0
      view.font = UIFont.systemFont(ofSize: size)
      view.backgroundColor = (count % 2 == 0) ? .red : .green
      views.append(view)
    }
    previewPane.show(views)
  }

}

