//
//  TableViewCell.swift
//  ios-contact-manager-ui_Hong
//
//  Created by yujaehong on 1/2/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    // MARK: - 멤버 저장속성 구현
    // 멤버가 변할때마다 자동으로 업데이트 되도록 구현 didSet(속성 감시자)⭐️
    var contactID: ContactID? {
        didSet {
            guard let contactID = contactID else { return }
            
            let contactIDAge = contactID.age != nil ? "(\(contactID.age!))" : ""
            let nameAgeText = "\(contactID.name!) \(contactIDAge)"
            
            textLabel?.text = nameAgeText
            detailTextLabel?.text = contactID.phoneNumber
        }
    }
    
    // MARK: - 생성자 셋팅
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell 셋팅
    private func setupCell() {
        textLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        detailTextLabel?.font = UIFont.systemFont(ofSize: 10)
        
        // 화살표를 표시하기 위한 설정
        accessoryType = .disclosureIndicator
    }
}

