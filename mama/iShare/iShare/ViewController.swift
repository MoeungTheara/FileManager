//
//  ViewController.swift
//  iShare
//
//  Created by Moeung Theara on 11/22/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit
import Social
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func share(){
        let shareFacebook:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        present(shareFacebook, animated:true, completion: nil)
    }
    
   
}

