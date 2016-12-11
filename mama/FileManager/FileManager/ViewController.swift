//
//  ViewController.swift
//  FileManager
//
//  Created by Moeung Theara on 11/30/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "c")!
        let binaryImageData = UIImageJPEGRepresentation(image, 1)
        writeData(file: binaryImageData!)
    }

    func writeData(file:Data)-> String? {
        let fileManager = FileManager.default
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        
        let myFolder = documentDirectory.appendingPathComponent("MyFolder")
      
        
        print("This my folder path", myFolder)
        
        let fileName = myFolder.appendingPathComponent("\(UUID()).jpg")
        
        print("This is my filename", fileName)
        do {
            //try fileManager.createDirectory(at: myFolder, withIntermediateDirectories: false, attributes: nil)
            try file.write(to: fileName)
            print(file)
            print("This is my filename",fileName.absoluteString)
            return fileName.absoluteString
        }catch let Error{
            print("Error" , Error)
        }
        
        return nil
    }


}

