//
//  ViewController.swift
//  KanjiBezierPaths
//
//  Created by Andriy K. on 12/25/2015.
//  Copyright (c) 2015 Andriy K.. All rights reserved.
//

import UIKit
import KanjiBezierPaths

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    let pathes = KanjiBezierPathesHelper.pathesForKanji("辞")
    print(pathes)
  }
  
}

