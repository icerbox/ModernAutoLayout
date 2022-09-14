import UIKit

class TileView: UIView {
  
  private let padding: CGFloat = 25.0
  
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

  private let greenView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .green
    return view
  }()
  
  private let blueView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .blue
    return view
  }()
  
  private let redView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    return view
  }()
  
  private func setupView() {
    addSubview(greenView)
    greenView.addSubview(blueView)
    greenView.addSubview(redView)
    changeNestedMargins(inset: padding)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      greenView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      greenView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      greenView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      greenView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
      
      blueView.leadingAnchor.constraint(equalTo: greenView.layoutMarginsGuide.leadingAnchor),
      blueView.topAnchor.constraint(equalTo: greenView.layoutMarginsGuide.topAnchor),
      blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -padding),
      blueView.bottomAnchor.constraint(equalTo: greenView.layoutMarginsGuide.bottomAnchor),
      blueView.widthAnchor.constraint(equalTo: redView.widthAnchor),
      
      redView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: padding),
//      redView.leadingAnchor.constraint(equalTo: greenView.layoutMarginsGuide.leadingAnchor),
      redView.topAnchor.constraint(equalTo: greenView.layoutMarginsGuide.topAnchor),
      redView.trailingAnchor.constraint(equalTo: greenView.layoutMarginsGuide.trailingAnchor),
      redView.bottomAnchor.constraint(equalTo: greenView.layoutMarginsGuide.bottomAnchor),
      redView.widthAnchor.constraint(equalTo: blueView.widthAnchor)
    ])
  }
  
  private func changeNestedMargins(inset: CGFloat) {
    if #available(iOS 11, *) {
      greenView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
      print("iOS 11")
    } else {
      greenView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
      print("Other version of iOS")
    }
  }

}
