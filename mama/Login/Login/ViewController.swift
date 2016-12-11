//
//  ViewController.swift
//  Login
//
//  Created by Moeung Theara on 11/8/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//
import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var signInbutton: UIButton!
    @IBOutlet weak var mesgLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextDield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextDield.delegate = self
        passwordTextField.delegate = self
        
    }

    @IBOutlet var myText: [UITextField]!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    //signIn touch
    
    @IBAction func signInClic(_ sender: Any) {
        checkUserLogin()
    }
    
    // touch return 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextDield {
           
            self.passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
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
            mesgLabel.text = "your username or password are incorrect!!!"
                //usernameTextDield.becomeFirstResponder()
            if usernameTextDield.text != "theara" {
                usernameTextDield.becomeFirstResponder()
                usernameTextDield.selectedTextRange = usernameTextDield.textRange(from:usernameTextDield.beginningOfDocument, to: usernameTextDield.endOfDocument)
            }
            else {
                passwordTextField.becomeFirstResponder()
                passwordTextField.selectedTextRange = passwordTextField.textRange(from: passwordTextField.beginningOfDocument, to: passwordTextField.endOfDocument)
            }
        }
       
        
        
        

    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let username = usernameTextDield.text
       let password = passwordTextField.text
       let destView = segue.destination as! SecondViewController
       destView.data["username"] = username
       destView.data["password"] = password
        
        
    }
}

