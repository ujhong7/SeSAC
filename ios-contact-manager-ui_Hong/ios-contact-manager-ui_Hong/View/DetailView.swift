//
//  DetailView.swift
//  ios-contact-manager-ui_Hong
//
//  Created by yujaehong on 1/3/24.
//

// 🔴 구조적인것 고민해보기 !!! 🔴

import UIKit

final class DetailView: UIView {
    // MARK: - 멤버 저장속성 구현
    // 데이터가 바뀌면 -> didSet(속성감시자) 구현
    // 속성감시자도 (저장 속성을 관찰하는) 어쨌든 자체는 메서드임
    var contactID: ContactID? {
        didSet {
            // Int -> String, String -> Int 와 같은 형 변환은 가능하면 extension 에 함수를 만들어서 처리할 수 있게 하기 ⭐️
            guard let contactID = contactID else { return }
            nameTextField.text = contactID.name
            ageTextField.text = contactID.age?.toString()
            phoneNumberTextField.text = contactID.phoneNumber
        }
    }
    
    // MARK: - UI 구현
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "이름:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var nameStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "나이:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ageTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var ageStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "번호:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneNumberTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var phoneNumberStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [phoneNumberLabel, phoneNumberTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()

    // 레이블 넓이 저장을 위한 속성
    let labelWidth: CGFloat = 40
    
    // MARK: - 생성자 셋팅
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI 셋팅
    private func setupUI() {
        addSubview(nameStackView)
        addSubview(ageStackView)
        addSubview(phoneNumberStackView)
    }
    
    // MARK: - 오토레이아웃 셋팅
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            
            nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            ageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ageLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            
            ageTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            ageTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phoneNumberLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

}

extension Int {
    func toString() -> String {
        var inputString = String(self)
        return inputString
    }
}
