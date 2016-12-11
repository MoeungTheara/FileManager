//
//  ViewController.swift
//  MYTableView
//
//  Created by Moeung Theara on 11/12/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating{
    var data:[String] = ["a.jpg","d.jpg","k.jpg","j.jpg"]
    @IBOutlet weak var searchBar: UISearchBar!
    var username:[String] = [ "Julie MaMa","Bott ChhengLy" ," Moeung Yeakeng","Moeung Theary" ]
    var chatText:[String] = ["Hello" ,"sad klang" ,"het ta ke","ke loy"]
    @IBOutlet weak var mytable: UITableView!
    let searching = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        mytable.delegate = self
        mytable.dataSource = self
        searching.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:UITableViewRowAnimation.fade)
        }
        NSLog("%@", data)
        
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObj = self.data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(moveObj, at: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(data)")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   
    func updateSearchResults(for searchController: UISearchController) {

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mytable") as! TableViewCell1
        cell.mylable.text = data[indexPath.row]
        cell.profileImage.image = UIImage(named:data[indexPath.row])
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2
        cell.profileImage.clipsToBounds = true
        cell.profileImage.layer.borderWidth = 1
        cell.profileImage.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.mylable.text = username[indexPath.row]
        cell.contentLabel.text = chatText[indexPath.row]
        
       // design(tableView)
        return cell
    }
    
    func design(_ tableView: UITableView) {
        let ele = tableView.dequeueReusableCell(withIdentifier: "mytable") as! TableViewCell1
        ele.profileImage.layer.cornerRadius = 30
        ele.profileImage.layer.borderWidth = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  
}

