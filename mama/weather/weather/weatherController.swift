//
//  weatherController.swift
//  weather
//
//  Created by Moeung Theara on 10/27/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class weatherController: UIViewController {

    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var weather: UITextField!
    var message = " "
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        weatherLabel.lineBreakMode = .byWordWrapping
        weatherLabel.numberOfLines = 0;
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    @IBAction func btnOk(_ sender: AnyObject) {
        city.text = weather.text
        
    if let url = URL(string:"http://www.weather-forecast.com/locations/" + (weather.text?.replacingOccurrences(of: " ", with: "-"))! + "/forecasts/latest")
    {
        let reqest:URLRequest = NSMutableURLRequest(url:url) as URLRequest
        let task = URLSession.shared.dataTask(with:reqest){
            data , response ,error in
            if error != nil {
                print(error ?? 0)
            }else{
                if let unwrapdata = data {
                    let newData = NSString(data:unwrapdata , encoding:String.Encoding.utf8.rawValue)
                    let stringSaperate = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                    if let newArray = newData?.components(separatedBy: stringSaperate){
                        if newArray.count > 1 {
                            let otherString = "</span></span></span></p><div class=\"forecast-cont\"><div class=\"units-cont\"><a class=\"units metric active\">&deg;C"
                            let otherArray = newArray[1].components(separatedBy: otherString )
                            if otherArray.count > 0 {
                                
                                self.message = otherArray[0].replacingOccurrences(of: "&deg", with: "degree")
                                print(otherArray[0])

                            }
                        }else{
                            self.message = "No Result!!!!"
                        }

                    }
                }// else close
               
                DispatchQueue.main.async(execute: { 
                    self.weatherLabel.text = self.message
                })
                
            }// if error close
        }
        
        task.resume()
        
      }
        
    }
}
