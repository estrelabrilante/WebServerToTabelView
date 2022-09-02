//
//  ViewController.swift
//  webservice
//
//  Created by user215496 on 9/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTabel: UITableView!
    
    //array of obj from class postmodel
    var userList = [postmodel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //calling function
        ApiCallService();
        
    }
    func ApiCallService(){
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
                        DispatchQueue.main.async {
                            self.myTabel.reloadData();
                        }
                       // print(self.userList)
                        
                    }
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
//MARK:Table View controller
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellWeb", for: indexPath);
        cell.textLabel?.text = self.userList[indexPath.row].title
        print(userList[indexPath.row].title!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43.5
    }
    
    
}












