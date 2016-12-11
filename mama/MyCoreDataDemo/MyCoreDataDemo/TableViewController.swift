//
//  TableViewController.swift
//  MyCoreDataDemo
//
//  Created by Moeung Theara on 12/1/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit
import CoreData
class TableViewController: UITableViewController ,UISearchResultsUpdating{
    var data:[Product]?
    var filterdata:[Product]?
    @IBOutlet var productTable: UITableView!
    var searchControll:UISearchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var AddButton: UIBarButtonItem!
    //view didload
    override func viewDidLoad() {
        super.viewDidLoad()
        searchControll.dimsBackgroundDuringPresentation = true
        searchControll.searchBar.sizeToFit()
        searchControll.searchResultsUpdater = self
        productTable.tableHeaderView = searchControll.searchBar
        productTable.reloadData()
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        

    }
    
 
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchControll.isActive && (filterdata?.count)! > 0{
            return (self.filterdata?.count)!
        }
        else{
            if let numOfRow = data {
                return numOfRow.count
            }
        }
        return 1
    }
    
    // return data to cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myProduct")
        let productName:String?
        let produtImage:String?
        if searchControll.isActive && (filterdata?.count)! > 0{
            productName = filterdata?[indexPath.row].pName
            produtImage  = filterdata?[indexPath.row].image
        }else{
            productName = data?[indexPath.row].pName
            produtImage  = data?[indexPath.row].image
        }
        
        if produtImage != nil {
             let imgName = produtImage?.components(separatedBy: "myPhotoProduct/")
             let datas = readFile(filename:(imgName?[1])!)
             cell?.imageView?.image = UIImage(data:datas!)
            // print(imgName)
        }
    
        cell?.textLabel?.text = productName
        return cell!
    }
    
    // get request data
    func getProduct () -> [Product]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Product")
        request.returnsObjectsAsFaults = false
        do {
            let requests = try getContext().fetch(request)
            //print("my data" , requests)
            return requests as? [Product]

        }catch let Error{
            print(Error)
        }
        
        return nil
    }
    
    //reload data
    override func viewWillAppear(_ animated: Bool) {
         data = getProduct()
      productTable.reloadData()
    }
    
    // get context object
    func getContext () -> NSManagedObjectContext  {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = delegate.persistentContainer.viewContext
        
        return context
    }
    // read file
    func readFile(filename:String)-> Data? {
        let fileManager = FileManager.default
        let path = fileManager.urls(for: .documentDirectory, in: .allDomainsMask)
        let documentDirectory = path[0]
        
        let myFolder = documentDirectory.appendingPathComponent("myPhotoProduct")
        
        let filename = myFolder.appendingPathComponent(filename)
        
        do {
            return try Data(contentsOf: filename)
        }catch let Error{
            print(Error)
        }
        return nil
    }
    
    //delete file 
    
    func deletefile(filename:String){
        let fileManager = FileManager.default
        let path = fileManager.urls(for: .documentDirectory, in: .allDomainsMask)
        let documentDirectory = path[0]
        let myFolder = documentDirectory.appendingPathComponent("myPhotoProduct")
        let filename = myFolder.appendingPathComponent(filename)
        do {
            try fileManager.removeItem(at: filename)
            print(filename)
        }catch{
            print("Can't remove Item")
        }
    }
    
    //search data
    
    func updateSearchResults(for searchController: UISearchController) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Product")
        filterdata?.removeAll(keepingCapacity: false)
        let search = NSPredicate(format: "pName CONTAINS[c] %@", searchController.searchBar.text!)
        request.predicate = search
        do{
            let requests = try getContext().fetch(request)
            filterdata = requests as! [Product]
            self.productTable.reloadData()
        }catch let Error{
            print(Error)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    // customize row swapping to show more button
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Edit data
        func edit() {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let view2 = storyboard.instantiateViewController(withIdentifier: "view2") as! ViewController
            view2.dataForEdit = data?[indexPath.row]
            present(view2, animated: true, completion: nil)
        }
        
        //delete data
        func delete() {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
            request.predicate = NSPredicate(format: "pName == %@ ", (data?[indexPath.row].pName)!)
            request.returnsObjectsAsFaults = false
            
            do{
                let requests = try getContext().fetch(request)
                if requests.count > 0 {
                    let imgPath = data?[indexPath.row].image
                    let imgName = imgPath?.components(separatedBy: "myPhotoProduct/")
                    for result in requests as! [NSManagedObject]{
                        if let productName = (result as AnyObject).value(forKey:"pName") as? String{
                            data?.remove(at: indexPath.row)
                            getContext().delete(result)
                            deletefile(filename: (imgName?[1])!)
                            
                            do{
                                try getContext().save()
                                print("sucess")
                            }
                            catch let Error{
                                print(Error)
                            }
                        }
                    }
                }
                print("our request",requests)
            }catch let Error{
                print(Error)
            }
            
            productTable.reloadData()
        }
        
        let moreRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Edit", handler:{action, indexpath in
            edit()
            
        });
        moreRowAction.backgroundColor = UIColor(red: 0.298, green: 0.851, blue: 0.3922, alpha: 1.0);
        
        let deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler:{action, indexpath in
            delete()
            tableView.reloadData()
        })
        
        
        return [deleteRowAction, moreRowAction]
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
//        if let ident = identifier {
//            if ident == "myDataTable" {
//                if AddButton.action != nil {
//                    return false
//                }
//            }
//      
//        }
//    return true
//    
//    }
   
    
}
