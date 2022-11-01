//
//  ViewController.swift
//  Conflict-v2
//
//  Created by Андрей Антонен on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  let padding: CGFloat = 20

  private var goButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Go", for: .normal)
    return button
  }()
  
  private var greenView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .green
    return view
  }()
  
  private var redView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    return view
  }()
  
  private func setupViews() {
    view.addSubview(goButton)
//    view.addSubview(greenView)
//    view.addSubview(redView)
    NSLayoutConstraint.activate([
      goButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      goButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      goButton.topAnchor.constraint(equalTo: view.topAnchor)
//      goButton.bottomAnchor.constraint(equalTo: greenView.topAnchor, constant: padding),
//      greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//      greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
//      greenView.topAnchor.constraint(equalTo: goButton.topAnchor, constant: padding),
//      greenView.bottomAnchor.constraint(equalTo: redView.topAnchor, constant: padding),
//      redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
//      redView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
//      redView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

