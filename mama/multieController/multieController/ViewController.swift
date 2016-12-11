//
//  ViewController.swift
//  multieController
//
//  Created by Moeung Theara on 10/27/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignIn.backgroundColor = UIColor.clear
        btnSignIn.layer.cornerRadius = 5
        btnSignIn.layer.borderWidth = 1
        btnSignIn.layer.borderColor = UIColor.white.cgColor
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

