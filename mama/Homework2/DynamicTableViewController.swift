//
//  DynamicTableViewController.swift
//  Homework2
//
//  Created by Moeung Theara on 11/23/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit
struct Product{
    var img:String
    var name:String
    var price:String
}
class DynamicTableViewController: UITableViewController,UISearchResultsUpdating, UISearchBarDelegate {

    @IBOutlet var productTableViewController: UITableView!
    var state = 1
    var products = [Product]()
    var myData:[String:String] = [:]
    var productFilter = [Product]()
     let searchController:UISearchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        products = [Product(img:"a.jpg",name:"Fashion Shoes",price:"$20.0"),
                    Product(img:"d.jpg",name:"Mitre Polarize T-Shirt",price:"$10.0"),
                    Product(img:"q.jpg",name:"GOES GREAT WITH",price:"$12.8"),
                    Product(img:"y.jpg",name:"Multimedia Collect",price:"$5.4"),
                    Product(img:"b.jpg",name:"Flaticon Basic ",price:"$9.5")]
        searchController.searchResultsUpdater = self
        productTableViewController.reloadData()
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
//        if productFilter.count > 0 {
//            searchController.dimsBackgroundDuringPresentation = false
//        }else{
//            searchController.dimsBackgroundDuringPresentation = true
//        }
        
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.alpha = 0.8
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        tableView.alpha = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

 
    @IBAction func searchClickButtton(_ sender: Any) {
        
        
        searchController.searchBar.sizeToFit()
        if state == 1 {
            state = 2
        productTableViewController.tableHeaderView = searchController.searchBar
                    print(state)
        }
        else  {
            productTableViewController.tableHeaderView = nil
            state = 1
            print(state)
        }
    }
 

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive {
             print("active")
            return (productFilter.count)
           
        }
        else{
            return products.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DynamicCell") as! DynamicTableViewCell
        var pro = [Product]()
            pro = productFilter
        if searchController.isActive && productFilter.count > 0 {
            cell.productImage.image = UIImage(named:(self.productFilter[indexPath.row].img))
            cell.productName.text = self.productFilter[indexPath.row].name
            cell.productPrice.text = self.productFilter[indexPath.row].price

        }
        else{
            cell.productImage.image = UIImage(named:products[indexPath.row].img)
            cell.productName.text = products[indexPath.row].name
            cell.productPrice.text = products[indexPath.row].price
 
        }
        
        return cell
    }
    
    //selectrow
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive == true && productFilter.count > 0 {
            
            myData["productImage"] = productFilter[indexPath.row].img
            myData["productName"] = productFilter[indexPath.row].name
            myData["productPrice"] = productFilter[indexPath.row].price
        }
        else{
            myData["productImage"] = products[indexPath.row].img
            myData["productName"] = products[indexPath.row].name
            myData["productPrice"] = products[indexPath.row].price
        }
        
            self.performSegue(withIdentifier: "ShowDetail", sender: myData)
            searchController.isActive = false
            searchController.dismiss(animated: true, completion: nil)
            //searchController.searchBar.touchesCancelled(searchController, with: UIEvent?)
            
    }
    
    //send data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dataDestination = segue.destination as! DetailTableViewController
        dataDestination.data["productImage"] =  myData["productImage"]!
        dataDestination.data["productName"] = myData["productName"]!
        dataDestination.data["productPrice"] = myData["productPrice"]!
    }
    
    //searching
    
    func updateSearchResults(for searchController: UISearchController) {
        
        productFilter.removeAll(keepingCapacity: false)
        
        productFilter = products.filter{
            product in
            return product.name.lowercased().contains((searchController.searchBar.text?.lowercased())!)
        }
      
        
        print("asas",productFilter)
    
        productTableViewController.reloadData()
    }
    

}
