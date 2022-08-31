import UIKit

private extension UIView {
  static func makeView(color: UIColor) -> UIView {
    let view = UIView()
    view.backgroundColor = color
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
}

final class TileView: UIView {
  
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
  
  private let padding: CGFloat = 50.0
  private let spacing: CGFloat = 25.0
  
  private let greenView = UIView.makeView(color: .green)
  private let blueView = UIView.makeView(color: .blue)
  private let redView = UIView.makeView(color: .red)
  
  private func setupView() {
    addSubview(greenView)
    addSubview(blueView)
    addSubview(redView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      greenView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      greenView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
      trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: padding),
      greenView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
      
      blueView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: spacing),
      blueView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: spacing),
      greenView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor, constant: spacing),
      
      redView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: spacing),
      greenView.trailingAnchor.constraint(equalTo: redView.trailingAnchor,constant: spacing),
      redView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: spacing),
      greenView.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: spacing),
      
      blueView.widthAnchor.constraint(equalTo: redView.widthAnchor),
      blueView.heightAnchor.constraint(equalTo: redView.heightAnchor)
    ])
  }
}
