import UIKit

final class StopGoView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  private let padding: CGFloat = 50.0
  private let spacing: CGFloat = 25.0
  
  private let redView = UIView.makeView(color: .red)
  private let greenView = UIView.makeView(color: .green)
  
  private func setupView() {
    addSubview(redView)
    addSubview(greenView)
    
    NSLayoutConstraint.activate([
      redView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      greenView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      
      trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: padding),
      trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: padding),
      
      redView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
      greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: spacing),
      bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: padding),
      
      redView.heightAnchor.constraint(equalTo: greenView.heightAnchor)
    ])
  }
}
