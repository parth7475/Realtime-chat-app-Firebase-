//
//  UserVC.swift
//  ChatApp
//
//  Created by Parth Lunagariya on 12/01/23.
//

import UIKit

class UserVC: UIViewController {

    @IBOutlet weak var btnParth: UIButton!
    @IBOutlet weak var btnTest: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clickOnBtnParth(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        vc.userId = "1"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func clickOnTest(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        vc.userId = "2"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
