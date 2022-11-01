//
//  ViewController.swift
//  Animate-v1
//
//  Created by Андрей Антонен on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
  
  private enum AnimationMetrics {
    static let offset: CGFloat = -200
    static let duration: TimeInterval = 2.0
    static let delay: TimeInterval = 1.0
    static let damping: CGFloat = 0.4
  }
  
  @IBOutlet weak var centerConstraint: NSLayoutConstraint!

  

  override func viewDidLoad() {
    super.viewDidLoad()
    centerConstraint.constant = AnimationMetrics.offset
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    animateButton(withDuration: AnimationMetrics.duration, damping: AnimationMetrics.damping, delay: AnimationMetrics.delay)
  }
                    
    private func animateButton(withDuration duration: TimeInterval, damping: CGFloat, delay: TimeInterval = 0) {
      centerConstraint.constant = 0.0
      let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: damping, animations: {
        self.view.layoutIfNeeded()
      })
      animator.startAnimation(afterDelay: delay)
    }

}

