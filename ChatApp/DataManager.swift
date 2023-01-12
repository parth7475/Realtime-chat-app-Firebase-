//
//  DataManager.swift
//  ChatApp
//
//  Created by Parth Lunagariya on 12/01/23.
//

import Foundation
import FirebaseFirestore

struct DBEntity {
    
    static let message = "message"
   
}

class DataManager : NSObject {
    
    var lastdate = String()
    
    var db : Firestore!
    var listner : ListenerRegistration!
    
    override init() {
        
        self.db = Firestore.firestore()
        
    }
    
    //object allocation
    static var sharedManager : DataManager = {
        let manager = DataManager()
        return manager
    }()
    
    class func shared() -> DataManager {
        return sharedManager
    }
    

    func getMessages(completion:@escaping ([Message]) -> Void) {
        
        db.collection(DBEntity.message).order(by: "date", descending: false).addSnapshotListener{ (querySnapshot, err) in
            
            var arrMsgs = [Message]()
            
            if let err = err {
                
                print("Error while getting documents: \(err)")
                
            } else {
                
                let data = querySnapshot!.documents
                arrMsgs = self.getuserLimitedData(arrData: data)
                DispatchQueue.main.async {
                    
                    completion(arrMsgs)
                }
            }
        }
        
        
    }
        

    func getuserLimitedData(arrData:[QueryDocumentSnapshot]) -> [Message]{
        
        var arrMsgs = [Message]()
        
        for document in arrData {
            
            var msg = Message()
            
            msg.key = document.documentID
            
            let data = document.data()
            
            if let text = data["message"] as? String {
                
                msg.msg = text
            }
            if let date = data["date"] as? Timestamp {
                
                msg.time = date.dateValue()
            }
            if let uid = data["uid"] as? String {
                
                msg.uId = uid
            }
            
            
            arrMsgs.append(msg)
        }
        
        return arrMsgs
        
    }
    
}








