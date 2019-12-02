//
//  DataTableViewCell.swift
//  GS25_WITHSOPT
//
//  Created by 최은지 on 03/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import Foundation
import UIKit

class DataTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productCreatedAt: UILabel!
    
    @IBOutlet weak var reserveButton: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
