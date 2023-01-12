//
//  ChatTableViewCell.swift
//  ChatApp
//
//  Created by Parth Lunagariya on 12/01/23.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMsg: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
