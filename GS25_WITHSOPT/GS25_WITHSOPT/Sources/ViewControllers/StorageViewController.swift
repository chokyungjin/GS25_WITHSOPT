//
//  StorageViewController.swift
//  GS25_WITHSOPT
//
//  Created by 조경진 on 2019/11/25.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class StorageViewController: UIViewController  {
    
    //IBOutlets...
    @IBOutlet weak var StorageTextView: UITextView!
    @IBOutlet weak var StorageImageView: UIImageView!
    
    @IBOutlet weak var storageCollectionView: UICollectionView!
    
    
    //Vars..
    var Storage: [DataClass] = []
    let dataManager = DataManager.sharedManager
    
    //inits..
    override func viewDidLoad() {
        super.viewDidLoad()
        StorageCheck()
        storageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        storageCollectionView.showsHorizontalScrollIndicator = false
        storageCollectionView.decelerationRate = .fast
        
    }
    override func viewDidAppear(_ animated: Bool) {
        reloadMovieLists()
    }
    
    func simpleAlert(title: String, message: String, type: Int?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var ok: UIAlertAction
        if type == 0{
            ok = UIAlertAction(title: "확인", style: .cancel)
        }else{
            ok = UIAlertAction(title: title, style: .cancel, handler: {action in
                self.dismiss(animated: true)
            })
            
        }
        alert.addAction(ok)
        
        self.present(alert, animated: true)
    }
    
    func setUp() {
        self.Storage = dataManager.getStorageList()
        storageCollectionView.delegate = self
        storageCollectionView.dataSource = self
    }
    
    func reloadMovieLists() {
        self.Storage = dataManager.getStorageList()
        DispatchQueue.main.async {
            self.storageCollectionView.reloadData()
        }
    }
    
    func StorageCheck() {
        
        //        let idx = 1
        //        let name = "바나나 우유"
        //        let price = 1000
        //        let image_url = "http://www.bing.co.kr/upload/product/20171113JNY3IZ.jpg"
        //        let create_time = "2019-11-23T14:07:43.000Z"
        
        DataManager.sharedManager.productCheck()
            {
                data in
                
                switch data {
                    
                case .success(let data):
                    
                    DataManager.sharedManager.setStorageList(list: data as! [DataClass])
                    self.setUp()
                    
                case .requestErr(let message):
                    self.simpleAlert(title: "로그인 실패", message: "\(message)", type: 0)
                case .pathErr:
                    print(".pathErr")
                    
                case .serverErr:
                    print(".serverErr")
                    
                case .networkFail:
                    self.simpleAlert(title: "로그인 실패", message: "네트워크 상태를 확인해주세요.", type: 1)
                }
        }
    }
}

extension StorageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(Storage.count)
        return Storage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storageListCellID", for: indexPath) as! StorageCollectionViewCell
        
        print(cell.frame)
        print(cell.productImage.frame)
        
        //        let StorageName = self.Storage.map {$0.name}[0]
        //                           self.StorageTextView.text = StorageName
        //                           let StorageURL = self.Storage.map {$0.image_url}[0]
        //                           self.StorageImageView.image = self.dataManager.getStorageImage(withURL: StorageURL)
        
        let storage = Storage[indexPath.row]
        
        cell.productname.text = "상품: " + String(describing: storage.name)
        cell.productprice.text = "가격: " + String(describing: storage.price) + "원"
        cell.productcreate_time.text = "제조일자: " + String(describing: storage.create_time)
        
    
        
        OperationQueue().addOperation {
            let storageImage = DataManager.sharedManager.getStorageImage(withURL: storage.image_url)
            DispatchQueue.main.async {
                cell.productImage.image = storageImage
                
            }
        }
        
        return cell
    }
    
}
