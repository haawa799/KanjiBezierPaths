//
//  ViewController.swift
//  Example
//
//  Created by Andrii Kharchyshyn on 5/17/17.
//  Copyright © 2017 @haawa799. All rights reserved.
//

import UIKit
import KanjiBezierPaths

class ViewController: UIViewController {

    let provider: KanjiProvider! = {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            return nil
        }
        let url = URL(fileURLWithPath: path)
        return KanjiProvider(appDocumentsURL: url, fileManager: FileManager.default)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let pathes = provider.pathesForKanji("等")!
        debugPrint(pathes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

