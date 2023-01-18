//
//  Extension.swift
//  ChatApp
//
//  Created by Parth Lunagariya on 17/01/23.
//

import Foundation
import UIKit

extension UIView{
    
    var cornerRadius : CGFloat {
        
        get { return  self.layer.cornerRadius }
        set {  self.layer.cornerRadius = newValue }
    }
}
