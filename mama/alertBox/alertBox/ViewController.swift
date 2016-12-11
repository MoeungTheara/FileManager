//
//  ViewController.swift
//  alertBox
//
//  Created by Moeung Theara on 10/24/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alert(_ sender: Any) {
        
        /// Show an alert with an "Okay" button.
   
            let title = NSLocalizedString("A Short Title is Best", comment: "")
            let message = NSLocalizedString("A message should be a short, complete sentence.", comment: "")
            let cancelButtonTitle = NSLocalizedString("OK", comment: "")
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            // Create the action.
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { action in
                NSLog("The simple alert's cancel action occured.")
            }
            
            // Add the action.
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
       

    }

}

