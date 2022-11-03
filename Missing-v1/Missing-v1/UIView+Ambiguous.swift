//
//  UIView+Ambiguous.swift
//  Missing-v1
//
//  Created by Андрей Антонен on 01.11.2022.
//

import UIKit

extension UIView {
  class func exerciseAmbiguity(_ view: UIView) {
    #if DEBUG
    if view.hasAmbiguousLayout {
      Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
        view.exerciseAmbiguityInLayout()
      }
    } else {
      for subview in view.subviews {
        UIView.exerciseAmbiguity(subview)
      }
    }
    #endif
  }
}
