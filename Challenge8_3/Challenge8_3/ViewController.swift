//
//  ViewController.swift
//  Challenge8_3
//
//  Created by Андрей Антонен on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var rootStackView: UIStackView!
  @IBOutlet weak var innerStackView: UIStackView!
  @IBOutlet weak var switchButton: UISwitch!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    hideCode()
  }
  
  @IBAction func showCode(_ sender: Any) {
    if switchButton.isOn {
      showCode()
    } else {
      hideCode()
    }
  }
  

  private func setupView() {
    let backgroundView = UIView()
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.backgroundColor = .purple
    rootStackView.insertSubview(backgroundView, at: 0)
    
    NSLayoutConstraint.activate([
      rootStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
      rootStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
      rootStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
      rootStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
    ])
  }
  private func hideCode() {
    let innerBackgroundView = UIView()
    innerBackgroundView.translatesAutoresizingMaskIntoConstraints = false
    innerBackgroundView.backgroundColor = .yellow
    innerStackView.insertSubview(innerBackgroundView, at: 4)
    NSLayoutConstraint.activate([
      innerStackView.leadingAnchor.constraint(equalTo: innerBackgroundView.leadingAnchor),
      innerStackView.trailingAnchor.constraint(equalTo: innerBackgroundView.trailingAnchor),
      innerStackView.topAnchor.constraint(equalTo: innerBackgroundView.topAnchor),
      innerStackView.bottomAnchor.constraint(equalTo: innerBackgroundView.bottomAnchor)
    ])
  }
  private func showCode() {
    if let lastView = innerStackView.subviews.last {
      innerStackView.removeArrangedSubview(lastView)
      lastView.removeFromSuperview()
    }
  }
}

