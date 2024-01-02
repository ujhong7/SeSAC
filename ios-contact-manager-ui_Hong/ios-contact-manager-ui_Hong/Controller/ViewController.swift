//
//  ViewController.swift
//  ios-contact-manager-ui_Hong
//
//  Created by yujaehong on 1/2/24.
//

import UIKit

final class ViewController: UIViewController {
    // 테이블뷰
    private let tableView = UITableView()
    
    // MVC패턴을 위한 데이터 매니저 (배열 관리 - 데이터)
    var memberListManager = MemberListManger()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDatas()
        setupTableView()
//        setupNaviBar()
//        setupTableViewConstraints()
    }
    
    func setupDatas(){
        memberListManager.makeMembersListDatas() // 일반적으로는 서버에 요청
    }
    
    // MARK: - tableView 세팅
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        // 셀의 등록 ⭐️ (타입인스턴스 - 메타타입)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }

    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    // 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이터 표시)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // (힙에 올라간)재사용 가능한 셀을 꺼내서 사용하는 메서드 (애플이 이미 잘 만들어 놓음)
        // (사전에 셀을 등록하는 과정이 내부 매커니즘에 존재)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! TableViewCell
        
        // 셀에다가 멤버를 전달 (멤버만 전달하먄, 화면에 표시하도록 구현 ⭐️ 셀에 didSet으로)
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let detailVC = DetailViewController()
        
        // 다음 화면의 대리자 설정 (다음 화면의 대리자는 지금 현재의 뷰컨트롤러)
        // detailVC.delegate = self
        
        // 다음 화면에 멤버를 전달
        // let currentMember = memberListManager.getMemberList()[indexPath.row]
        // detailVC.member = currentMember
        
        
        // 화면이동
        navigationController?.pushViewController(detailVC, animated: true)
        //show(detailVC, sender: nil)
    }
}








