//
//  ViewController.swift
//  NSLayoutConstraint-v1
//
//  Created by Андрей Антонен on 27.08.2022.
//

import UIKit

class ViewController: UIViewController {
  
  private let padding: CGFloat = 50.0

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
    // Do any additional setup after loading the view.
  }

  private let redView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    return view
  }()
  
  private let orangeView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .orange
    return view
  }()
  
  func setupViews() {
    view.backgroundColor = .yellow
    view.addSubview(redView)
  }
  
  func setupConstraints() {
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: padding),
      
      NSLayoutConstraint(item: redView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -padding),
      
      NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: padding),
      
      NSLayoutConstraint(item: redView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -padding)
    ])
  }
  
}

