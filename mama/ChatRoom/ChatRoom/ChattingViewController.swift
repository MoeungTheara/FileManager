//
//  ChattingViewController.swift
//  ChatRoom
//
//  Created by Moeung Theara on 11/16/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class ChattingViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating{
    var profileImage:[String] = ["a.jpg","d.jpg","k.jpg","j.jpg"]
    @IBOutlet weak var searchBar: UISearchBar!
    var username:[String] = [ "Julie MaMa","Bott ChhengLy" ," Moeung Yeakeng","Moeung Theary" ]
    var chatText:[String] = ["Hello" ,"sad klang" ,"het ta ke","ke loy"]
      let searching = UISearchController()
    
    @IBOutlet weak var chatTableViewController: UITableView!
    @IBOutlet weak var chattingTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chattingTable.delegate = self
        chattingTable.dataSource = self
        addSearchBar()
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            profileImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:UITableViewRowAnimation.fade)
        }
        NSLog("%@", profileImage)
        
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObj = self.profileImage[sourceIndexPath.row]
        profileImage.remove(at: sourceIndexPath.row)
        profileImage.insert(moveObj, at: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(profileImage)")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileImage.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mychatCell") as! ChatRoomTableViewCell
       
       
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2
        cell.profileImage.clipsToBounds = true
        cell.profileImage.layer.borderWidth = 1
        cell.profileImage.layer.borderColor = UIColor.white.cgColor
        
        cell.profileImage.image = UIImage(named:profileImage[indexPath.row])
        cell.userNameLable.text = username[indexPath.row]
        cell.chatTextLable.text = chatText[indexPath.row]
        return cell
    }
    
    func design(_ tableView: UITableView) {
        let ele = tableView.dequeueReusableCell(withIdentifier: "mychatCell") as! ChatRoomTableViewCell
        ele.profileImage.layer.cornerRadius = 30
        ele.profileImage.layer.borderWidth = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //addsearch 
    
    func addSearchBar(){
        var searchController:UISearchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
        chatTableViewController.tableHeaderView = searchController.searchBar
        
    }
    
}

