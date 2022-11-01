//
//  ViewController.swift
//  Challenge9_2_2
//
//  Created by Андрей Антонен on 28.09.2022.
//

import UIKit

class RootViewController: UIViewController {
  
  private lazy var panicView: PanicView = {
    let view = PanicView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .blue
    view.delegate = self
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .yellow
    view.addSubview(panicView)
    
    let margins = view.layoutMarginsGuide
    NSLayoutConstraint.activate([
      margins.leadingAnchor.constraint(equalTo: panicView.leadingAnchor),
      margins.centerYAnchor.constraint(equalTo: panicView.centerYAnchor),
      margins.trailingAnchor.constraint(equalTo: panicView.trailingAnchor)
    ])
  }
}

extension RootViewController: PanicViewDelegate {
  func panic(_ sender: PanicView) {
    print("Panic!")
  }
  
  func noPanic(_ sender: PanicView) {
    print("Don't Panic!")
  }
}
