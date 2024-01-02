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
    var member: Member?{
        didSet{
            guard var member = member else { return }
            
            nameLabel.text = member.name
            ageLabel.text = member.age != nil ? "\(member.age!)" : ""
            phoneNumberLabel.text = member.phoneNumber
        }
    }
    
    // MARK: - UI구현
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // MARK: - 생성자 셋팅
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - StackView
    func setupStackView(){
        // 셀 위에 스택뷰 올리기
        self.addSubview(stackView)
        
        // 스택뷰 위에 뷰들 올리기
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.addArrangedSubview(phoneNumberLabel)
    }
    
    // MARK: - 오토레이아웃 셋팅
    override func updateConstraints() {
        setupStackView()
        super.updateConstraints()
    }
    
    
    
    
}
