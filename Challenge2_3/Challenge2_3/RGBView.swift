import UIKit

final class RGBView: UIView {
  
  var padding: CGFloat = 20.0 {
    didSet {
      setNeedsLayout()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupViews()
  }
  
  private let redView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()
  
  private let greenView: UIView = {
    let view = UIView()
    view.backgroundColor = . green
    return view
  }()
  
  private let blueView: UIView = {
    let view = UIView()
    view.backgroundColor = .blue
    return view
  }()
  
  private func setupViews() {
    addSubview(redView)
    addSubview(greenView)
    addSubview(blueView)
  }
  
  override func layoutSubviews() {
    let containterWidth = bounds.width
    // 375.0
    let containterHeight = bounds.height
    // 667.0
    
    let numberOfItems: CGFloat = 3

    let itemWidth = containterWidth
    // 91.66
    let itemHeight = (containterHeight - 2 * padding) / numberOfItems
    
    
    redView.frame = CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight)
    greenView.frame = CGRect(x: 0, y: itemHeight + padding, width: itemWidth, height: itemHeight)
    blueView.frame = CGRect(x: 0, y: itemHeight * 2 + 2 * padding, width: itemWidth, height: itemHeight)
  }
}
