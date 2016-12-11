//
//  FirstViewController.swift
//  myServerCommunication
//
//  Created by Moeung Theara on 12/8/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController ,NIFetchDataDelegate{

    var delegate:NIFetchDataDelegate?
    var data:[String:Any]? = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data?[ "TITLE"] = "Switf 3"
        data?[ "DESCRIPTION"] = "IOS"
        data?[ "AUTHOR"] = 0
        data?[ "CATEGORY_ID"] = 0
        data?[ "STATUS"] = "user"
        data?[ "IMAGE"] = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func postButtonClick(_ sender: Any) {
        postData()
    }

    @IBAction func getButtonClick(_ sender: Any) {
        getData()
    }
    func getData(){
        
        let url = URL(string: "http://120.136.24.174:1301/v1/api/articles?page=1&limit=15")!
        
        let request = NSMutableURLRequest(url:url)
         request.setValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let getTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if error != nil{
                print(error!)
            }else{
                
                if let urlContent = data{
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print("----This is my data-----",jsonResult)
                        
                    }catch{
                        print("JSON Processing Failed")
                    }
                }
            }
        }
        getTask.resume()
    }
    
    //Post data
    func postData(){
        let url = URL(string: "http://120.136.24.174:1301/v1/api/articles")!
        print("i'm post")
        let request = NSMutableURLRequest(url:url)
        request.setValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
       
        request.httpBody = try! JSONSerialization.data(withJSONObject: data ?? "unknown" as Any, options: [])
     
        let posttTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let _ = data, error == nil else {
                if let error = error as? NSError{
                    self.delegate?.FetchErrorFromClient!(errorMessage : error)
                }
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // check for http errors
                self.delegate?.FetchDataResponseHTTPEroro!(responseError:httpStatus)
                return
            }
            print(response)
        }
        
        posttTask.resume()
    }
    
    private func FetchDataResponseHTTPEroro(errorResponse: HTTPURLResponse) {
        print("Server error code \(errorResponse.statusCode)")
        print("Server error \(errorResponse)")
    }
    
    func FetchErrorFromClient(errorMessage: NSError) {
        print("Error : \(errorMessage)")
    }
    
    private func FetchDataResponseSuccess(responseData: [String : AnyObject]) {
        print("Success \(responseData)")
    }

}
