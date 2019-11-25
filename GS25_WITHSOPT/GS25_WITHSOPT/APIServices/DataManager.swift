//
//  DataManager.swift
//  GS25_WITHSOPT
//
//  Created by 조경진 on 2019/11/25.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import Alamofire

class DataManager {
    
    static let sharedManager: DataManager = {
        let dm = DataManager()
        return dm
    }()
    
    //Vars..
    var dataStorage: [DataClass] = []
    
    private init() {
        
    }
    
    private var haveImage: UIImage!
    
    func getImage() -> UIImage {
        return haveImage
    }
    func setImage(haveImage : UIImage) {
        self.haveImage = haveImage
    }
    
    private var haveTitle: String!
    
    func getTitle() -> String {
        return haveTitle
    }
    func setTitle(haveTitle : String) {
        self.haveTitle = haveTitle
    }
    
    //Shared MovieLists
    private var storageList: [DataClass] = []
    
    func setStorageList(list: [DataClass]) {
        storageList = list
    }
    
    func getStorageList() -> [DataClass] {
        return storageList
    }
    
    func getStorageImage(withURL StorageURL: String) -> UIImage? {
        guard let imageURL = URL(string: StorageURL) else {
            return UIImage(named: "img_placeholder")
        }
        
        guard let imageData: Data = try? Data(contentsOf: imageURL) else {
            return UIImage(named: "img_placeholder")
        }
        
        return UIImage(data: imageData)
    }
    
    func productCheck(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"]
        
        //            let body: Parameters = [
        //                "idx": idx,
        //                "name": name,
        //                "price": price,
        //                "image_url": image_url,
        //                "create_time": create_time]
        
        Alamofire.request(APIConstants.BaseURL, method: .get ,headers: header).responseData { response in
            switch response.result {
                
            case .success:
                print("response.result=",response.result)
                if let value = response.data {
                    if let status = response.response?.statusCode {
                        print("status=", status)
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseString.self, from: value)
                                
                                switch result.success {
                                    
                                case true:
                                    print("success")
                                    completion(.success(result.data))
                                    
                                case false:
                                    completion(.requestErr(result.message))
                                }
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                                
                            }
                        case 400:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }// switch
                    }// iflet
                }
                break
            // 통신 실패 - 네트워크 연결
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
                // .networkFail이라는 반환 값이 넘어감
                break
            } // response.result switch
        } // alamofire.request
        
    }
    
}
