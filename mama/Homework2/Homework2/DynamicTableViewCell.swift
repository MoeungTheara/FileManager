//
//  DynamicTableViewCell.swift
//  Homework2
//
//  Created by Moeung Theara on 11/23/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

class DynamicTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
  
    @IBOutlet weak var productPrice: UILabel!

    @IBOutlet weak var productName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        // Configure the view for the selected state
    }
    

}
