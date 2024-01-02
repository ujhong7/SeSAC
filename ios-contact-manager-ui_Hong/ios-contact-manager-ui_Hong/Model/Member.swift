//
//  Member.swift
//  ios-contact-manager-ui_Hong
//
//  Created by yujaehong on 1/2/24.
//

import UIKit

struct Member{
    // 멤버의 (절대적)순서를 위한 타입 저장속성
    // 타입 저장속성 - 모든 인스턴스들이 공유할 수 있는 저장속성
    static var memberNumbers: Int = 0
    
    let memberId: Int
    
    var name: String?
    var age: Int?
    var phoneNumber: String?
 
    init(name: String? = nil, age: Int? = nil, phoneNumber: String? = nil) {
        // 타입 저장속성에 저장되어 있는 값으로 순번 매기기
        self.memberId = Member.memberNumbers
        
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
        
        // 멤버를 생성한다면, 항상 타입 저장속성 값 +1
        Member.memberNumbers += 1
    }
   
}
