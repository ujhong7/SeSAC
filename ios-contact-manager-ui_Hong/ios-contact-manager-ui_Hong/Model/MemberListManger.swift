//
//  MemberListManger.swift
//  ios-contact-manager-ui_Hong
//
//  Created by yujaehong on 1/2/24.
//

import UIKit

final class MemberListManger {
    //- 연락처 보기
    //- 연락처 추가
    //- 연락처 삭제
    //- 연락처 변경(optional)
    
    // 멤버리스트를 저장하기 위한 배열
    private var memberList: [Member] = []
    
    // 전체 멤버 리스트 만들기
    func makeMembersListDatas(){
        memberList = [
            Member(name: "james", age: 30, phoneNumber: "010-1234-5678"),
            Member(name: "steven", age: 100, phoneNumber: "010-1313-2323")
        ]
    }
    
    // 전체 멤버 리스트 얻기
    func getMemberList() -> [Member] {
        return memberList
    }
    
    // 새로운 멤버 만들기
    func makeNewMember(_ member: Member){
        memberList.append(member)
    }
    
    
    
    
    
    
}
