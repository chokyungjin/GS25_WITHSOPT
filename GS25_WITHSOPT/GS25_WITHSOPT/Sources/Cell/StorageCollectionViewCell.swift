//
//  StorageCollectionViewCell.swift
//  GS25_WITHSOPT
//
//  Created by 조경진 on 2019/11/25.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class StorageCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var productImage : UIImageView!
    @IBOutlet weak var productname : UILabel!
    @IBOutlet weak var productprice : UILabel!
    @IBOutlet weak var productcreate_time : UILabel!
    override func prepareForReuse() {
        
    }
}
