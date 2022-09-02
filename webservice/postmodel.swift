//
//  postmodel.swift
//  webservice
//
//  Created by user215496 on 9/2/22.
//

import Foundation
var baseurl = "https://jsonplaceholder.typicode.com/posts"
//structure of data in the url
class postmodel{
    var userId: Int?
    var id: Int?
    var title: String?
    var boby: String?
    //constructor
    init(dictobj:[String:Any]){
        self.userId = dictobj["userId"] as? Int
        self.id = dictobj["id"] as? Int
        self.title = dictobj["title"] as? String
        self.boby = dictobj["body"] as? String
    }
    
}
