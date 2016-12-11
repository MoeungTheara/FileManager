//
//  SecondViewController.swift
//  Login
//
//  Created by Moeung Theara on 11/8/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var data:[String:String] = [:]
    
    @IBOutlet weak var passWordLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = data["username"]
        passWordLabel.text = data["password"]
    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
