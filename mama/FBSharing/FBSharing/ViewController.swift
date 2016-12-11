//
//  ViewController.swift
//  FBSharing
//
//  Created by Moeung Theara on 11/23/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit
import Social
class ViewController: UIViewController {
    var img:String = "s.jpg"
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var postingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImage.image = UIImage(named:img)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func shareTofacebook(_ sender: UIButton) {
        let share:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            share.setInitialText(postingLabel.text)
            share.add(UIImage(named:img))
            self.present(share, animated:true, completion: nil)
    }

}

