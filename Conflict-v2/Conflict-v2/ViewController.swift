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
  
  private var goButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Go", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
    button.addTarget(self, action: #selector(go(_:)), for: .touchUpInside)
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
  
  private lazy var redConstraints: [NSLayoutConstraint] = {
    let margins = view.layoutMarginsGuide
    return [
      greenView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.25),
      redView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 1.0)
    ]
  }()
    
  private lazy var greenConstraints: [NSLayoutConstraint] = {
    let margins = view.layoutMarginsGuide
    return [
      greenView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 1.0),
      redView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.25)
    ]
  }()
  
  private lazy var commonConstraints: [NSLayoutConstraint] = {
    let margins = view.layoutMarginsGuide
    return [
      goButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
      goButton.topAnchor.constraint(equalToSystemSpacingBelow: margins.topAnchor, multiplier: 2.0),
      
      greenView.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
      greenView.topAnchor.constraint(equalToSystemSpacingBelow: goButton.bottomAnchor, multiplier: 2.0),
      greenView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.2),

      redView.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
      redView.topAnchor.constraint(equalToSystemSpacingBelow: greenView.bottomAnchor, multiplier: 2.0),
      redView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.2)
    ]
  }()
  
  private func setupViews() {
    view.backgroundColor = .yellow
    view.addSubview(goButton)
    view.addSubview(greenView)
    view.addSubview(redView)
    NSLayoutConstraint.activate(commonConstraints + greenConstraints)
  }
  
  @objc private func go(_ sender: UIButton) {
    NSLayoutConstraint.deactivate(greenConstraints)
    NSLayoutConstraint.activate(redConstraints)
  }
}

