//
//  SignInViewController.swift
//  ChatRoom
//
//  Created by Moeung Theara on 11/4/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtPassWord: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        myDesign()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myDesign() {
        txtUserName.layer.cornerRadius = 10
        txtPassWord.layer.cornerRadius = 10
        txtUserName.clipsToBounds = true
        txtPassWord.clipsToBounds = true
               
        
       
    }
    
    
    

}
