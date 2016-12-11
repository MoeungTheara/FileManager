//
//  FriendChatTableViewController.swift
//  TableViewTesting
//
//  Created by Moeung Theara on 11/11/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class FriendChatTableViewController: UITableViewController   {
    
    //@IBOutlet weak var dataLabel: UILabel!
    var data:[String] = ["a.jpg","s.jpg","dd"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.data.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "friendChatCell", for: indexPath) as! FriendChatTableViewCell
            cell.profil
        
        
        return cell
    }
   

    }
