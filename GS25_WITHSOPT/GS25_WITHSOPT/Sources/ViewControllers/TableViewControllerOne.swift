//
//  TableViewControllerOne.swift
//  GS25_WITHSOPT
//
//  Created by 조경진 on 2019/11/18.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TableViewControllerOne: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        780
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOne", for: indexPath) as! TableViewCellOne
        
        
        
        cell.selectionStyle = .none
        return cell
    }
    
}

extension TableViewControllerOne: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        
        
        return IndicatorInfo(title: "QR 코드")
    }
    
    
    
}
