//
//  SecondViewController.swift
//  delegate
//
//  Created by Moeung Theara on 11/3/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

protocol userEnteredDelegate {
    func userDidEnteredImformation (info:String)
}

class SecondViewController: UIViewController{

    @IBOutlet weak var txtStr: UITextField!
    
    var delegate:userEnteredDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClick(_ sender: Any) {
        if (delegate != nil) {
            let information:String = txtStr.text!
            delegate!.userDidEnteredImformation(info: information)
            self.navigationController?.popViewController(animated: true)
        }
    }

    

}
