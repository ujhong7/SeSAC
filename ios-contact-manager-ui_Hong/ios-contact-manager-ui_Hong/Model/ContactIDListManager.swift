//
//  ContactIDListManager.swift
//  ios-contact-manager-ui_Hong
//
//  Created by yujaehong on 1/2/24.
//

import UIKit

final class ContactIDListManager {
    //- 연락처 보기
    //- 연락처 추가
    //- 연락처 삭제
    //- 연락처 변경(optional)
    
    // 데이터 리스트를 저장하기 위한 배열
    private var contactIDList: [ContactID] = []
    
    // 데이터 리스트 만들기
    func makeContactIDListDatas(){
        contactIDList = [
            ContactID(name: "james", age: 30, phoneNumber: "010-1234-5678"),
            ContactID(name: "steven", age: 100, phoneNumber: "010-1313-2323"),
            ContactID(name: "hajin", age: 60, phoneNumber: "010-4342-2536"),
            ContactID(name: "mini", age: 25, phoneNumber: "010-4433-7653"),
            ContactID(name: "hojun", age: 40, phoneNumber: "010-6647-4573"),
            ContactID(name: "dooly", age: 95, phoneNumber: "010-3634-9567")
        ]
    }
    
    // 전체 데이터 리스트 얻기
    func getContactIDList() -> [ContactID] {
        return contactIDList
    }
    
    // 새로운 데이터 만들기
    func makeNewContactID(_ contactID: ContactID){
        print(#function)
        contactIDList.append(contactID)
    }
    
    // 데이터 정보 업데이트
    func updateMemberInfo(index: Int, _ contactID: ContactID){
        contactIDList[index] = contactID
    }
    
    // 특정 멤버 얻기
    subscript(index: Int) -> ContactID{
        get{
            return contactIDList[index]
        }
    }
    
}
