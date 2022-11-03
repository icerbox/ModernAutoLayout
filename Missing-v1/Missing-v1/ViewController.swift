//
//  ViewController.swift
//  Missing-v1
//
//  Created by Андрей Антонен on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupConstraints()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
//    print(view.value(forKey: "_autolayoutTrace")!)
    UIView.exerciseAmbiguity(view)
  }
  
  private struct ViewMetrics {
    static let backgroundColor: UIColor = .yellow
    static let margin: CGFloat = 20.0
  }
  
  private let customView: CustomView = {
    let view = CustomView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .yellow
    return view
  }()

  private func setupView() {
    view.addSubview(customView)
    view.backgroundColor = ViewMetrics.backgroundColor
    
    view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: ViewMetrics.margin, leading: ViewMetrics.margin, bottom: ViewMetrics.margin, trailing: ViewMetrics.margin)
    
  }
  
  private func setupConstraints() {
    let margins = view.layoutMarginsGuide
    NSLayoutConstraint.activate([
      customView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
      customView.topAnchor.constraint(equalTo: margins.topAnchor),
      customView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    ])
  }
  
  private func checkAmbiguousLayout(_ view: UIView) {
    view.subviews.forEach {
      _ = $0.hasAmbiguousLayout
      checkAmbiguousLayout($0)
    }
  }
  
}

