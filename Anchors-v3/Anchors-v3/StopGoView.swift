import UIKit

extension UIView {
  var safeTopAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11, *) {
      return safeAreaLayoutGuide.topAnchor
    } else {
      return bottomAnchor
    }
  }
  var safeBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11, *) {
      return safeAreaLayoutGuide.bottomAnchor
    } else {
      return topAnchor
    }
  }
  var safeLeadingAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11, *) {
      return safeAreaLayoutGuide.leadingAnchor
    } else {
      return leadingAnchor
    }
  }
  var safeTrailingAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11, *) {
      return safeAreaLayoutGuide.trailingAnchor
    } else {
      return trailingAnchor
    }
  }
}

final class StopGoView: UIView {
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  private let externalPadding: CGFloat = 50.0
  private let internalSpacing: CGFloat = 25.0
  
  private let redView = UIView.makeView(color: .red)
  private let greenView = UIView.makeView(color: .green)
  
  private func setupView() {
    addSubview(redView)
    addSubview(greenView)

    NSLayoutConstraint.activate([
      redView.leadingAnchor.constraint(equalTo: safeLeadingAnchor, constant: externalPadding),
      greenView.leadingAnchor.constraint(equalTo: safeLeadingAnchor, constant: externalPadding),
      
      safeTrailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: externalPadding),
      safeTrailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: externalPadding),
      
      redView.topAnchor.constraint(equalTo: safeTopAnchor, constant: externalPadding),
      greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: internalSpacing),
      safeBottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: externalPadding),
      
      redView.heightAnchor.constraint(equalTo: greenView.heightAnchor)
    ])
  }
}
