//
//  JuiceMakingViewController.swift
//  JuiceMaker_Hong
//
//  Created by yujaehong on 12/4/23.
//

import UIKit

// 📖 final 키워드 알아보자!
final class JuiceMakingViewController: UIViewController {
    // 레이블
    @IBOutlet var numberOfStrawberry: UILabel!
    @IBOutlet var numberOfBanana: UILabel!
    @IBOutlet var numberOfPineApple: UILabel!
    @IBOutlet var numberOfKiwi: UILabel!
    @IBOutlet var numberOfMango: UILabel!
    
    // 버튼
    @IBOutlet var orderStrawberryButton: UIButton!
    @IBOutlet var orderBananaButton: UIButton!
    @IBOutlet var orderPineAppleButton: UIButton!
    @IBOutlet var orderKiwiButton: UIButton!
    @IBOutlet var orderMangoButton: UIButton!
    @IBOutlet var orderStrawberryBananaButton: UIButton!
    @IBOutlet var orderMangoKiwiButton: UIButton!
    
    @IBOutlet var stockChangeButton: UIBarButtonItem!
    
    // 쥬스메이커 생성
    // 📖 private 키워드
    private let juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    // 📖 왜 override를 해야하며 super.viewDidLoad()가 없으면 실제 어떤일이 일어나나요?
    override func viewDidLoad() {
        super.viewDidLoad()
        // 레이블 작성
        showNumberOnLabel(fruits: juiceMaker.fruitStore.inventory)
        // 버튼 동작
        setUpTargetActionOnButtons()
        // 옵저버 등록
        registerObserver()
    }

    deinit {
        print(#function)
        turnOffObserver()
    }
    
}

// MARK: - 레이블 셋팅
extension JuiceMakingViewController {
    func setup(number: Int, on label:UILabel) {
        label.text = String(number)
    }
    
    func showNumberOnLabel(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                setup(number: fruit.value, on: numberOfStrawberry)
            case .banana:
                setup(number: fruit.value, on: numberOfBanana)
            case .pineapple:
                setup(number: fruit.value, on: numberOfPineApple)
            case .kiwi:
                setup(number: fruit.value, on: numberOfKiwi)
            case .mango:
                setup(number: fruit.value, on: numberOfMango)
            }
        }
    }
}
    
// MARK: - 버튼 & 알림창
extension JuiceMakingViewController {
    // 버튼 입력
    func setUpTargetActionOnButtons() {
        orderStrawberryButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderPineAppleButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderStrawberryBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for:.touchUpInside)
        orderMangoKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        
        stockChangeButton.target = self
        stockChangeButton.action = #selector(stockChangeButtonTapped)
    }
    
    // 쥬스 제조 동작
    @objc func orderJuice(_ sender: UIButton) {
        let result: JuiceMaker.JuiceMakingResult
        
        switch sender {
        case orderStrawberryButton:
            result = juiceMaker.produce(.strawberry)
        case orderBananaButton:
            result = juiceMaker.produce(.banana)
        case orderPineAppleButton:
            result = juiceMaker.produce(.pineapple)
        case orderKiwiButton:
            result = juiceMaker.produce(.kiwi)
        case orderMangoButton:
            result = juiceMaker.produce(.mango)
        case orderStrawberryBananaButton:
            result = juiceMaker.produce(.strawberryBanana)
        case orderMangoKiwiButton:
            result = juiceMaker.produce(.mangoKiwi)
        default:
            let message = "잘못된입력입니다."
            result = .failure(description: message)
        }
        
        // 알림창 띄우기
        self.present(generateAlert(by: result), animated: true, completion: nil)
        
    }
    
    // 알림창 설정
    func generateAlert(by result: JuiceMaker.JuiceMakingResult) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        switch result {
        case .success(let message):
            alert.message = message
            alert.addAction(UIAlertAction(title: "확인", style: .default))
        case .failure(let message):
            alert.message = message
            alert.addAction(UIAlertAction(title: "예", style: .default, handler: transitionToStockManagement(_:)))
            alert.addAction(UIAlertAction(title: "아니오", style: .default))
        }
        return alert
    }
    
    // 재고 수정 버튼 동작 (재고수정화면으로 이동)
       @objc func stockChangeButtonTapped() {
           fruitInventoryDataToStockManagementViewController()
       }
}
   

// MARK: - 화면이동
extension JuiceMakingViewController {
    // 알림창 "예" 눌렀을 시 재고수정화면으로 이동
    func transitionToStockManagement(_ sender: UIAlertAction) {
        fruitInventoryDataToStockManagementViewController()
    }
}

// MARK: - 옵저버
extension JuiceMakingViewController {
    // 수량 변화 감지 옵저버
    func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeFruitsAmount(_:)), name: Notification.Name("fruitsAmountDidChange"), object: nil)
    }
    
    @objc func didChangeFruitsAmount(_ notification: Notification) {
        // 🔵 notification.userInfo -> Notification 객체에 연결된 사용자 정의 정보를 나타냄 (사용자 정의 데이터를 저장하는 Dictionary)
        guard let userInfo = notification.userInfo, let fruitInfo = userInfo as? [Fruit : Int] else {
            return
        }
        // 수량 변환에 따른 레이블 변화
        self.showNumberOnLabel(fruits: fruitInfo)
    }
    
    func turnOffObserver() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("fruitsAmountDidChange"), object: nil)
    }
}

// MARK: - 화면이동시 데이터 전달
private extension JuiceMakingViewController {
    func fruitInventoryDataToStockManagementViewController() {
        if let stockManagementVC = self.storyboard?.instantiateViewController(withIdentifier: "StockManagementViewController") as? StockManagementViewController {
            stockManagementVC.receivedFruitInventoryData = juiceMaker.fruitStore.inventory
            let stockManagementNavigationController = UINavigationController(rootViewController: stockManagementVC)
            self.present(stockManagementNavigationController, animated: true, completion: nil)
        }
    }
}



