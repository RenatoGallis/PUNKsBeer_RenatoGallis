//@IBOutlet weak internal var ivImage: UIImageView!
//  BeerTableViewCell.swift
//  38654RenatoGallis
//
//  Created by@IBOutlet weak internal var ivImage: UIImageView
//  Copyright © 2017 user132786. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak internal var ivImage: UIImageView!
    @IBOutlet weak internal var lbName: UILabel!
    @IBOutlet weak internal var lbAbv:  UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
