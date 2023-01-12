//
//  DataModel.swift
//  ChatApp
//
//  Created by Parth Lunagariya on 12/01/23.
//

import Foundation

struct Message{
    
    var key: String
    var msg: String
    var time: Date
    var uId:String
    
    init() {
        key = ""
        msg = ""
        time = Date()
        uId = ""
    }
}
