//
//  webAPI.swift
//  webservice
//
//  Created by user215496 on 9/6/22.
//

import Foundation
import UIKit
class webAPI{
    static var instance = webAPI();
    var userList = [postmodel]();
    func APICallService(completion: @escaping(_ success:Bool,_ result:[postmodel]) -> ()){
        let url = URL(string: baseurl)!
        //URL request to server for data
        var request = URLRequest(url: url);
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type");
        //URLSession to fetch data
        let session = URLSession.shared.dataTask(with: request) { data,response,error in
            do{
                let result = try JSONSerialization.jsonObject(with: data!)
                if result != nil{
                    let details = result as! [[String:Any]]
                    for i in details{
                        let obj = postmodel(dictobj: i)
                        self.userList.append(obj);
                       
                       // print(self.userList)
                        
                    }
                    
                    completion(true,self.userList);
                }
                else{
                    
                }
            }
            catch{
                
            }
            
        }
    session.resume();
    }
}

