//
//  DetailViewController.swift
//  ios-contact-manager-ui_Hong
//
//  Created by yujaehong on 1/2/24.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func addNewMember(_ contactID: ContactID)
    func update(index: Int, _ contactID: ContactID)
}

class DetailViewController: UIViewController {
    // MVC패턴을 위해 따로만든 뷰
    private let detailView = DetailView()
    
    // 전화면에서 Member데이터를 전달 받기 위한 변수
    var contactID: ContactID?
    
    // 대리자설정을 위한 변수(델리게이트)
    weak var delegate: DetailViewControllerDelegate?
    
    // MVC패턴을 위해서 view교체
    override func loadView() {
        view = detailView
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        setupData()
        saveButtonAction()

    }
    
    // 멤버를 뷰에 전달 ⭐️ (뷰에서 알아서 화면 셋팅)
    private func setupData() {
        // 데이터 전달: ViewController -> DetailViewController -> DetailView
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
            
            // 새로운 데이터 (구조체) 생성
            let newContactID = ContactID(name: name, age: age, phoneNumber: phoneNumber)
            // 🔴
            delegate?.addNewMember(newContactID)
            print("@@@@@@@@@@@@@@@@")
        } else {
            // 데이터 있을 경우 (데이터 수정화면)
            print("updateButtonTapped")
            contactID!.name = detailView.nameTextField.text ?? ""
            contactID!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            contactID!.phoneNumber = detailView.phoneNumberTextField.text ?? ""
            
            // 뷰에도 바뀐 멤버를 전달 (뷰컨트롤러->뷰)
            detailView.contactID = contactID
        
            // 🔴
            // delegate?.update(index: <#T##Int#>, contactID!)
        }
        // (일 처리를 다한 후에) 전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }
}
