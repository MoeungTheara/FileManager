//
//  ChatRoomTableVC.swift
//  ChatRoom
//
//  Created by Moeung Theara on 11/16/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class ChatRoomTableVC: UITableViewController {
    var userImage:[String] = ["a.jpg","k.jpg","s.jpg"]
    var username:[String]  = ["Julie Ma Ma" ,"Moeung Theara" , "Moeung YeakMeng"]
    var textChat:[String] = ["Ke Loy" ,"Het ta ke" , "Idol XD"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.userImage.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mychatCell") as! ChatRoomTableViewCell
        cell.profileImage.image = UIImage(named:userImage[indexPath.row])
        cell.userNameLable.text = username[indexPath.row]
        cell.chatTextLable.text = textChat[indexPath.row]
        return cell
    }
    

    
}
