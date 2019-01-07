//
//  DetailCell.swift
//  HelloWorld
//
//  Created by 黄小白 on 2019/1/5.
//  Copyright © 2019 Sherley Huang's studio. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
