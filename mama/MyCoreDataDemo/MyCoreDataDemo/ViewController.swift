//
//  ViewController.swift
//  MyCoreDataDemo
//
//  Created by Moeung Theara on 11/30/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var productQtyTextBox: UITextField!
    @IBOutlet weak var productPriceTextBox: UITextField!
    @IBOutlet weak var productNameTextBox: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    var imageUpload:Data?
    var dataForEdit:Product?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getdataForEdit()
        print(dataForEdit)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func uploadImage(_ sender: Any) {
        getImageFormGallary()
    }
    @IBAction func addButton(_ sender: Any) {
        if submitButton.currentTitle == "Submit" {
            insertProduct()
        }
        
        if submitButton.currentTitle == "Update" {
            updateProduct()
        }
        
        
        self.navigationController?.popViewController(animated: true)        
        
    }
    
    func getContext () -> NSManagedObjectContext  {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = delegate.persistentContainer.viewContext
        
        return context
    }
    
    func writeImage(imageFile:Data) -> String?{
        let fileManager = FileManager.default
        let path = fileManager.urls(for:.documentDirectory, in: .allDomainsMask)
        let documentDirectory = path[0]
        
        let myFolder = documentDirectory.appendingPathComponent("myPhotoProduct")
        let fileName = myFolder.appendingPathComponent("\(UUID()).jpg")
        
     
            do{
                //print(myFolder.absoluteString)
                if !fileManager.fileExists(atPath: myFolder.absoluteString) {
                    try fileManager.createDirectory(at: myFolder, withIntermediateDirectories: true, attributes: nil)
                }
                try imageFile.write(to: fileName)
                
                
                print(fileName)
                
            }
            catch let Error{
                print(Error)
            }
        
        return fileName.absoluteString
        
    }
    
    func getImageFormGallary(){
        let images = UIImagePickerController()
        images.delegate = self
        images.sourceType = UIImagePickerControllerSourceType.photoLibrary
        images.allowsEditing = false
        self.present(images, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myImage.image = image
            self.dismiss(animated: true, completion: nil)
            imageUpload = UIImageJPEGRepresentation(image, 1)
            
        }else{
            
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //get dataForEdit
    
    func getdataForEdit(){
        productNameTextBox.text = dataForEdit?.pName
        productPriceTextBox.text = dataForEdit?.pPrice.description
        productQtyTextBox.text  = dataForEdit?.pQTy.description
        let produtImage  = dataForEdit?.image
        if produtImage != nil {
            let imgName = produtImage?.components(separatedBy: "myPhotoProduct/")
            let datas = readFile(filename:(imgName?[1])!)
             myImage.image = UIImage(data:datas!)
        }
        if dataForEdit != nil{
                  submitButton.setTitle("Update", for: UIControlState.normal)
        }
  
        
    }
    
    // insert data 
    
    func insertProduct(){
        let newProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: getContext())
        newProduct.setValue( UUID().uuidString, forKey: "pId")
        newProduct.setValue(productNameTextBox.text, forKey: "pName")
        newProduct.setValue(Double(productPriceTextBox.text!), forKey: "pPrice")
        newProduct.setValue(Int(productQtyTextBox.text!), forKey: "PQTy")
        let image = UIImage(data:imageUpload! )
        let binaryImage = UIImageJPEGRepresentation(image!, 1)
        
        let imagePath = writeImage(imageFile: binaryImage!)
        newProduct.setValue(imagePath , forKey: "image")
        
        do{
            try getContext().save()
            
            
            print("Saved")
        }catch let Error{
            print(Error)
        }

    }
    
    // upate product
    
    func updateProduct(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Product")
        request.returnsObjectsAsFaults = false
        let searchRequest = NSPredicate(format: "pId = %@", (dataForEdit?.pId)!)
        request.predicate = searchRequest
        do{
            let requests = try getContext().fetch(request)
            if requests.count > 0 {
                    let updateResult = requests[0] as! Product
                    updateResult.setValue(productNameTextBox.text, forKey: "pName")
                    updateResult.setValue(Double(productPriceTextBox.text!), forKey: "pPrice")
                    updateResult.setValue(Int(productQtyTextBox.text!), forKey: "pQTy")
                if dataForEdit?.image != nil && imageUpload != nil{
                    
                    let image = UIImage(data:imageUpload! )
                    let binaryImage = UIImageJPEGRepresentation(image!, 1)
                    let imagePath = writeImage(imageFile: binaryImage!)
                    updateResult.setValue(imagePath , forKey: "image")
                }
                
                
                do{
                    try getContext().save()
                    self.dismiss(animated: true, completion: nil)
                }catch let Error{
                    print(Error)
                }
            }
        }catch{
            
        }
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
    
}

