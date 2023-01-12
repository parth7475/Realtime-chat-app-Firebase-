//
//  ChatVC.swift
//  ChatApp
//
//  Created by Parth Lunagariya on 12/01/23.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var txtMsg: UITextField!
    @IBOutlet weak var tblChat: UITableView!
    
    var userId = ""
    
    var arrMsg = [Message]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblChat.estimatedRowHeight = UITableView.automaticDimension
        DataManager.shared().getMessages { data in
            self.arrMsg = data
            self.tblChat.reloadData()
            
        }
        
    }
    

    @IBAction func clickOnSend(_ sender: Any) {
        if txtMsg.text != ""{
            DataManager.shared().db.collection(DBEntity.message).document().setData(["message":txtMsg.text ?? "abc","date":Date(),"uid":userId]) { error in
                if error == nil{
                    self.txtMsg.text = ""
                    
                }else{
                    print(error?.localizedDescription ?? "")
                }
            }
        }
        
        
    }
    
}

extension ChatVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMsg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = arrMsg[indexPath.row]
        
        if userId == data.uId{
            let cell = tblChat.dequeueReusableCell(withIdentifier: "SenderCell", for: indexPath) as! SenderCell
            cell.lblMsg.text = data.msg
            return cell
        }else{
            let cell = tblChat.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
            cell.lblMsg.text = data.msg
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
