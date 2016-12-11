//
//  ViewController.swift
//  weather
//
//  Created by Moeung Theara on 10/27/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceDesign()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //design function
    
    func interfaceDesign () {
        username.layer.backgroundColor = UIColor(red: 255/255, green: 246/255, blue:246/255, alpha: 1.0).cgColor
        passWord.layer.backgroundColor =  UIColor(red: 255/255, green: 246/255, blue:246/255, alpha: 1.0).cgColor
        btnSignIn.layer.borderWidth = 1
        btnSignIn.layer.cornerRadius = 5
        btnSignIn.layer.borderColor =  UIColor(red: 169/255, green: 149/255, blue:149/255, alpha: 1.0).cgColor
        btnSignUp.layer.borderWidth = 1
        btnSignUp.layer.cornerRadius = 5
        btnSignUp.layer.borderColor =  UIColor(red: 169/255, green: 149/255, blue:149/255, alpha: 1.0).cgColor
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

