//
//  OrderViewController.swift
//  GS25_WITHSOPT
//
//  Created by 최은지 on 03/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Kingfisher

class OrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSet = [DataClass]() // cell 에 들어갈 데이터 저장 배열
    
    private var refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        self.tableView.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        downloadData()
    }
    
    @objc func refresh(){
        downloadData()
        self.refreshControl.endRefreshing()
    }
    
    func downloadData(){
        DataManager.sharedManager.productCheck(){
            response in
            
            switch response {
                
            case .success(let data):
                self.dataSet = data as! [DataClass]
                print("@@@@@ count : " , self.dataSet.count)
                self.tableView.reloadData()
                
            case .requestErr(_):
                print(".requestErr")
                
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
            
        }
        
    }
    
    
    
}

extension OrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataTableViewCell else { return UITableViewCell() }
        
        cell.productName.text = "\(dataSet[indexPath.row].name)"
        cell.productPrice.text = "\(dataSet[indexPath.row].price) 원"
        cell.productCreatedAt.text = "\(dataSet[indexPath.row].create_time)"
//
        let urlStr = dataSet[indexPath.row].image_url
        let url = URL(string: urlStr)
        
        cell.productImageView.kf.setImage(with: url)
        
        
        return cell
    }
    
    
}
