//
//  ViewController.swift
//  Challenge4_4
//
//  Created by Андрей Антонен on 26.08.2022.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func start(_ sender: Any) {
    verticalConstraint.constant = 0
  }
  
  

  
}

