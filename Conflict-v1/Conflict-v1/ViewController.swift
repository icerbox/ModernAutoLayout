//
//  ViewController.swift
//  Conflict-v1
//
//  Created by Андрей Антонен on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    let okButton = UIButton(type: .system)
    okButton.setTitle("OK", for: .normal)
    okButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(okButton)
    
    NSLayoutConstraint.activate([
      okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      okButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

  
}

