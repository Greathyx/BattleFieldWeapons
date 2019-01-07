//
//  CardCell.swift
//  HelloWorld
//
//  Created by 黄小白 on 2019/1/3.
//  Copyright © 2019 Sherley Huang's studio. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var bkImgView: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var weaponLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    var favourite = false {
        willSet {
            if newValue {
                favButton.setImage(UIImage(named: "fav"), for: .normal)
            } else {
                favButton.setImage(UIImage(named: "unfav"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
