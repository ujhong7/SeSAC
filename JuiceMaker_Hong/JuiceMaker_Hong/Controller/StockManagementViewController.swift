//
//  StockManagementViewController.swift
//  JuiceMaker_Hong
//
//  Created by yujaehong on 12/4/23.
//

import UIKit

protocol StockManagementViewControllerDelegate: AnyObject {
    func updateStockData(updatedData: [Fruit: Int])
}

class StockManagementViewController: UIViewController {
    @IBOutlet var numberOfStrawberryLabel: UILabel!
    @IBOutlet var numberOfBananaLabel: UILabel!
    @IBOutlet var numberOfPineAppleLabel: UILabel!
    @IBOutlet var numberOfKiwiLabel: UILabel!
    @IBOutlet var numberOfMangoLabel: UILabel!
    
    @IBOutlet var changeAmountOfStrawberryStepper: UIStepper!
    @IBOutlet var changeAmountOfBananaStepper: UIStepper!
    @IBOutlet var changeAmountOfPineAppleStepper: UIStepper!
    @IBOutlet var changeAmountOfKiwiStepper: UIStepper!
    @IBOutlet var changeAmountOfMangoStepper: UIStepper!
    
    @IBAction func cancleButton(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        print("완료버튼눌림")
        delegate?.updateStockData(updatedData: receivedFruitInventoryData)
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    weak var delegate: StockManagementViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("재고: \(receivedFruitInventoryData)")
        showNumberOnLabel(fruits: receivedFruitInventoryData)
        setUpStepperTargets()
        setUpStepperAmount()
    }
    
    deinit {
        print(#function)
        print("수정된 재고: \(receivedFruitInventoryData)")
    }
    
    var receivedFruitInventoryData: [Fruit:Int] = [:]
}

// MARK: - 레이블 셋팅
extension StockManagementViewController {
    func setUp(number: Int, on label:UILabel) {
        label.text = String(number)
    }
    
    func showNumberOnLabel(fruits: [Fruit: Int]) {
        for fruit in fruits {
            switch fruit.key {
            case .strawberry:
                setUp(number: fruit.value, on: numberOfStrawberryLabel)
            case .banana:
                setUp(number: fruit.value, on: numberOfBananaLabel)
            case .pineapple:
                setUp(number: fruit.value, on: numberOfPineAppleLabel)
            case .kiwi:
                setUp(number: fruit.value, on: numberOfKiwiLabel)
            case .mango:
                setUp(number: fruit.value, on: numberOfMangoLabel)
            }
        }
    }
}

// MARK: - 스테퍼 세팅
extension StockManagementViewController {
    func setUpStepperTargets() {
        changeAmountOfStrawberryStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        changeAmountOfBananaStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        changeAmountOfPineAppleStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        changeAmountOfKiwiStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        changeAmountOfMangoStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func stepperValueChanged(_ stepper: UIStepper) {
        switch stepper {
        case changeAmountOfStrawberryStepper:
            numberOfStrawberryLabel.text = "\(Int(stepper.value))"
            receivedFruitInventoryData[.strawberry] = Int(stepper.value)
        case changeAmountOfBananaStepper:
            numberOfBananaLabel.text = "\(Int(stepper.value))"
            receivedFruitInventoryData[.banana] = Int(stepper.value)
        case changeAmountOfPineAppleStepper:
            numberOfPineAppleLabel.text = "\(Int(stepper.value))"
            receivedFruitInventoryData[.pineapple] = Int(stepper.value)
        case changeAmountOfKiwiStepper:
            numberOfKiwiLabel.text = "\(Int(stepper.value))"
            receivedFruitInventoryData[.kiwi] = Int(stepper.value)
        case changeAmountOfMangoStepper:
            numberOfMangoLabel.text = "\(Int(stepper.value))"
            receivedFruitInventoryData[.mango] = Int(stepper.value)
        default:
            break
        }
    }
    
    func setUpStepperAmount() {
        changeAmountOfStrawberryStepper.value = Double(receivedFruitInventoryData[.strawberry] ?? 0)
        changeAmountOfBananaStepper.value = Double(receivedFruitInventoryData[.banana] ?? 0)
        changeAmountOfPineAppleStepper.value = Double(receivedFruitInventoryData[.pineapple] ?? 0)
        changeAmountOfKiwiStepper.value = Double(receivedFruitInventoryData[.kiwi] ?? 0)
        changeAmountOfMangoStepper.value = Double(receivedFruitInventoryData[.mango] ?? 0)
    }
}
