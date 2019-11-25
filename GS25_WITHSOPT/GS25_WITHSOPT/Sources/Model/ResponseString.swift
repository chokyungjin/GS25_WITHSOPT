//
//  ResponseString.swift
//  GS25_WITHSOPT
//
//  Created by 조경진 on 2019/11/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import Foundation
//Codable struct 생성
//Codable protocol은 JSON, plist 등으로 이루어 진 데이터를 편리하게 객체로 변환해주는 protocol..
//Decodable과 Encodable로 이루어져 있다.


// MARK: - ResponseString // 성공했을 때 response body
struct ResponseString: Codable {
    let success: Bool
    let message: String
    let data: [DataClass]?
 
}

// MARK: - DataClass
struct DataClass: Codable {
  //  let userIdx: Int
    let idx, price : Int
    let name: String
    let image_url: String
    let create_time: String
  //  let id , password: String
    
    enum CodingKeys: String,CodingKey{
        
        case idx = "idx"
        case price = "price"
        case name = "name"
        case image_url = "image_url"
        case create_time = "create_time"
    }
}



