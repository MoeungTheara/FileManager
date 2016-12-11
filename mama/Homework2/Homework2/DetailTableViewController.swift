//
//  DetailTableViewController.swift
//  Homework2
//
//  Created by Moeung Theara on 11/23/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productName: UILabel!
    var data:[String:String] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.image = UIImage(named:data["productImage"]!)
        priceLabel.text = data["productPrice"]
        productName.text = data["productName"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 3
    }

  

}
