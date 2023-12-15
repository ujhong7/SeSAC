//
//  StockManagementViewController.swift
//  JuiceMaker_Hong
//
//  Created by yujaehong on 12/4/23.
//

import UIKit

class StockManagementViewController: UIViewController {
    
    @IBOutlet var numberOfStrawberry: UILabel!
    @IBOutlet var numberOfBanana: UILabel!
    @IBOutlet var numberOfPineApple: UILabel!
    @IBOutlet var numberOfKiwi: UILabel!
    @IBOutlet var numberOfMango: UILabel!
    
    @IBOutlet var changeAmountOfStrawberry: UIStepper!
    @IBOutlet var changeAmountOfBanana: UIStepper!
    @IBOutlet var changeAmountOfPineApple: UIStepper!
    @IBOutlet var changeAmountOfKiwi: UIStepper!
    @IBOutlet var changeAmountOfMango: UIStepper!
    
    @IBAction func cancleButton(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        print("완료버튼눌림")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("@@ \(receivedFruitInventoryData)")
        showNumberOnLabel(fruits: receivedFruitInventoryData)
        
    }
    
    deinit {
        print(#function)
    }
    
    var receivedFruitInventoryData: [Fruit:Int] = [:]
    
    // MARK: - 레이블 셋팅
    func setUp(number: Int, on label:UILabel) {
        label.text = String(number)
    }
    
    func showNumberOnLabel(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                setUp(number: fruit.value, on: numberOfStrawberry)
            case .banana:
                setUp(number: fruit.value, on: numberOfBanana)
            case .pineapple:
                setUp(number: fruit.value, on: numberOfPineApple)
            case .kiwi:
                setUp(number: fruit.value, on: numberOfKiwi)
            case .mango:
                setUp(number: fruit.value, on: numberOfMango)
            }
        }
    }
    
}
