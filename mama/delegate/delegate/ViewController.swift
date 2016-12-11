//
//  ViewController.swift
//  delegate
//
//  Created by Moeung Theara on 11/3/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class ViewController: UIViewController , userEnteredDelegate {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userDidEnteredImformation(info: String) {
        label.text = info
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showSecondVC" {
                let secondVC:SecondViewController = segue.destination as! SecondViewController
                secondVC.delegate = self
            }
        
    }


}

