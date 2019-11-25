//
//  ProductService.swift
//  GS25_WITHSOPT
//
//  Created by 조경진 on 2019/11/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import Foundation
import Alamofire

struct ProductService {
    
    static let shared = ProductService()
    //구조체의 정적 객체 생성
    
    //Vars..
    let dataManager = DataManager.sharedManager
    var dataStorage: [DataClass] = []
    
    
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
                                    
                                    self.dataManager.setStorageList(list: result.data!)
                                    
                                    print("!!!")
                                    print(self.dataManager.getStorageList())
                                    print("!!!")
                                    
                                    
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
    
    
} // struct
