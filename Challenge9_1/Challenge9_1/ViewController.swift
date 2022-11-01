import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var slowHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var fastHeightConstraint: NSLayoutConstraint!
  
  
  private enum Speed {
    case slow
    case fast
  }
  
  private var speed = Speed.slow {
    didSet {
      if speed != oldValue {
        setConstraints(for: speed, animate: true)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setConstraints(for: speed, animate: false)
  }
  
  @IBAction private func slow(_ sender: UIButton) {
    speed = .slow
  }
  
  @IBAction private func fast(_ sender: UIButton) {
    speed = .fast
  }
  
  private func setConstraints(for speed: Speed, animate: Bool) {
    switch speed {
    case .slow:
      NSLayoutConstraint.deactivate([fastHeightConstraint])
      NSLayoutConstraint.activate([slowHeightConstraint])
    case .fast:
      NSLayoutConstraint.deactivate([slowHeightConstraint])
      NSLayoutConstraint.activate([fastHeightConstraint])
    }
    
    if animate {
      let animator = UIViewPropertyAnimator(duration: 0.25, curve: .linear) {
        self.view.layoutIfNeeded()
      }
      animator.startAnimation()
    }
  }

}

