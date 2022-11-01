import UIKit

final class TileView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  

  
  let imageView = UIImageView(named: "CrazyShadow", top: 0, left: 0, bottom: 30, right: 30)
  
  private func setupView() {
    addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
