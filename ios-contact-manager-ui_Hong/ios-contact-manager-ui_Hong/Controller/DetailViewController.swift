//
//  DetailViewController.swift
//  ios-contact-manager-ui_Hong
//
//  Created by yujaehong on 1/2/24.
//

import UIKit

protocol AddDelegate: AnyObject {
    func addNewMember(_ contactID: ContactID)
}

protocol UpdateDelegate: AnyObject {
    func update(index: Int, _ contactID: ContactID)
}

class DetailViewController: UIViewController {
    // MVC패턴을 위해 따로만든 뷰
    private let detailView = DetailView()
    
    // 전화면에서 Member데이터를 전달 받기 위한 변수
    var contactID: ContactID?
    
    var index: Int = -1
    
    // 대리자설정을 위한 변수(델리게이트)
    weak var addDelegate: AddDelegate?
    weak var updateDelegate: UpdateDelegate?
    
    // MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    // 🐧 이렇게 index, contactID 에 값을 넣어주는건 DetailViewController 안에서 하기
    // 굳이 이 코드를 외부에서 사용하는 ViewController 가 알아야 할 필요가 있을까?
    // 이런 사고를 계속해봐야함. 추상화, 캡슐화에 대해 검색해보기
    convenience init(index: Int, contactID: ContactID) {
        self.init()
        self.index = index
        self.contactID = contactID
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = detailView
        updateContactData()
        saveButtonAction()

        view.backgroundColor = .yellow
    }
    
    // 데이터를 뷰에 전달
    func updateContactData() {
        detailView.contactID = contactID
    }
    
    private func saveButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        if contactID == nil {
            // 데이터 없을 경우 (새로운 데이터 추가화면)
            print("saveButtonTapped")
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "") ?? 0
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            
            // 🔴
            // 새로운 데이터 (구조체) 생성
            let newContactID = ContactID(name: name, age: age, phoneNumber: phoneNumber)
            addDelegate?.addNewMember(newContactID)
        } else {
            // 데이터 있을 경우 (데이터 수정화면)
            print("updateButtonTapped")
            guard var contactID = detailView.contactID else { return }
            contactID.name = detailView.nameTextField.text ?? ""
            contactID.age = Int(detailView.ageTextField.text ?? "") ?? 0
            contactID.phoneNumber = detailView.phoneNumberTextField.text ?? ""
    
            // 🔴
            updateContactData()
            updateDelegate?.update(index: index, contactID)
        }
        // (일 처리를 다한 후에) 전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }
}
