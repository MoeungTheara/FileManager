//: Playground - noun: a place where people can play

import UIKit
protocol pro {
    static func cry ()
}
protocol Test:pro  {
    var name:String {  get set }
    func move(action:String) -> String
 
    
}

enum myEnum:Test {

    var name: String {
        get{
            return ""
        }
        set{
            name = "fffd"
        }
    }
    static func cry() {
        print ("Hikk")
    }

    func move(action: String) -> String {
        return action + "Lolz"
    }

    
}

extension Array {
    func think(){
        print("stop thinking")
    }
     func sort () {
        
    }
}


