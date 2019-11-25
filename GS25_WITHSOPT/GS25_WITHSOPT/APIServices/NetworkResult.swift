//
//  NetworkResult.swift
//  GS25_WITHSOPT
//
//  Created by 조경진 on 2019/11/23.
//  Copyright © 2019 조경진. All rights reserved.
//

import Foundation

// 네트워크 상태의 5가지 결과 (성공, 요청 에러, 경로 에러, 서버 에러, 통신 실패)
//열거형 정의.. case별로 구분
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}

//API 주소별로 인스턴스 생성

struct APIConstants {
    
    // 전역 변수로 사용할 수 있게 APIConstants 선언하여 사용 // 상품 조회 GET url
    static let BaseURL = "http://13.125.32.163:3000/api/products"
    
    //장바구니 조회
    static let BasketURL = BaseURL + "basket/members"
    //보관함 조회
    static let StorageURL = BaseURL + "storage/members"
    //자주 찾는 상품 조회 , 최근 본 상품 조회
    static let RecentURL = BaseURL + "/recent/members"
    
    
    /* 유저(User) */
 //   static let LoginURL = BaseURL + "/signin" // 로그인
  //  static let SignupURL = BaseURL + "/signup" // 회원가입
    
    
}


