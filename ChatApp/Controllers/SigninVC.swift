//
//  SigninVC.swift
//  ChatApp
//
//  Created by Parth Lunagariya on 17/01/23.
//

import UIKit

class SigninVC: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSignin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        backView.cornerRadius = 25
        backView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        btnSignin.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
