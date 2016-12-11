//
//  ViewController.swift
//  Login
//
//  Created by Moeung Theara on 11/8/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var signInbutton: UIButton!
    @IBOutlet weak var mesgLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextDield: UITextField!
    //var enable: Bool = true
    var message:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextDield.delegate = self
        passwordTextField.delegate = self
        usernameTextDield.addTarget(self, action: #selector(textChange), for: UIControlEvents.editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChange), for: UIControlEvents.editingChanged)
        design()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func textChange(){
       
            self.mesgLabel.alpha = 0
      
    }
    
    //signIn touch
    
    @IBAction func signInClic(_ sender: Any) {
        checkUserLogin()
    }
    
    // touch return
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextDield {
            self.mesgLabel.alpha = 1
            mesgLabel.text = message
            self.passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
            self.mesgLabel.alpha = 1
            self.passwordTextField.resignFirstResponder()
            checkUserLogin()
        }
        
        
        return true
    }
    // close keyboard when touch outside textfiled
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //check user function
    
    func checkUserLogin () {
        if usernameTextDield.text == "theara" && passwordTextField.text == "1234"
        {
            self.performSegue(withIdentifier: "secondVC", sender: self)
            
           
        }
        else{
            
            message = "your username or password is incorrect!"
            mesgLabel.text = message
            usernameTextDield.becomeFirstResponder()
           
            if usernameTextDield.text != "theara" {
                usernameTextDield.becomeFirstResponder()
                usernameTextDield.selectedTextRange = usernameTextDield.textRange(from:usernameTextDield.beginningOfDocument, to: usernameTextDield.endOfDocument)
            }
            else if  passwordTextField.text != "1234" {
                passwordTextField.becomeFirstResponder()
                passwordTextField.selectedTextRange = passwordTextField.textRange(from: passwordTextField.beginningOfDocument, to: passwordTextField.endOfDocument)
            }

        }
        
        
    }
    func design () {
        usernameTextDield.layer.cornerRadius = 20
        passwordTextField.layer.cornerRadius = 20
        usernameTextDield.layer.borderWidth = 1
        passwordTextField.layer.borderWidth = 1
        usernameTextDield.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
    
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let username = usernameTextDield.text
        let password = passwordTextField.text
        let destView = segue.destination as! SecondViewController
        destView.data["username"] = username
        destView.data["password"] = password
        
        
    }
}

