//
//  ViewController.swift
//  Loop-v1
//
//  Created by Андрей Антонен on 02.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
  @IBOutlet weak var contentView: UIView!
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    contentView.layer.cornerRadius = contentView.bounds.width / 25
    view.setNeedsLayout()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

