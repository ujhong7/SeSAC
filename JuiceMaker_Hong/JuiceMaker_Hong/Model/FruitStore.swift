//
//  FruitStore.swift
//  JuiceMaker_Hong
//
//  Created by yujaehong on 12/4/23.
//

import Foundation

final class FruitStore {
    // 에러
    enum InventoryManagementError : Error {
        fileprivate static let outOfStockMessage = "재료가 모자라요. 재고를 수정할까요?"
        fileprivate static let fruitThatDoesNotExistMessage = "그런 과일은 없습니다!"
        
        case inventoryError(description: String)
    }
    
    // ⭐️⭐️⭐️⭐️⭐️
    // reduce -> '시퀀스의 각 요소'에 대해 제공된 클로저를 사용하여 값을 결합 reduce(초기값) 여기에서는 빈 딕셔너리임 ([Fruit: Int]())
    private(set) var inventory = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
        var bag = bag // 클로저 내에서 값을 직접 변경할 수 없기 때문에 새로운 변수에 값을 할당
        let initialNumberOfFruits = 10
        bag[fruit] = initialNumberOfFruits // 현재 순회 중인 과일에 대한 재고를 딕셔너리에 추가합니다.
        return bag // 없데이트된 딕셔너리를 반환 -> reduce 함수는 이 반환값을 다음 순회에 사용하여 값을 누적합니다. -> inventory 프로퍼티에 할당되어 해당 과일의 초기 재고를 나타내게 됩니다.
    }
    
    // 🔵 재고수정 후 메인화면 돌아오고 다시 재고수정 갔을때 값변화 ⭐️⭐️⭐️⭐️⭐️
    func updateInventory(_ updatedData: [Fruit: Int]) {
           inventory = updatedData
       }
    
    
//    private(set)은 속성의 접근 제어 수준을 설정하는 부분입니다.
//    private(set)은 외부에서는 읽기만 허용하고, 쓰기는 해당 타입 내부에서만 가능하도록 설정합니다. 
//    즉, 외부에서는 읽기만 가능하며, 내부에서는 읽기와 쓰기가 모두 가능합니다.
    
//    // 과일의 수량 n개를 변경하는 함수 🔴
//    func changeAmount(_ fruit: Fruit, _ number: Int) {
//        inventory[fruit] = number
//    }
    
    // 🔴 수량 변화 알림
    private func sendNotification(about fruit: Fruit, number: Int) {
        NotificationCenter.default.post(name: Notification.Name("fruitsAmountDidChange"), object: nil, userInfo: [fruit: number])
    }
    
    // 재고 감소 함수
    private func decreaseStock(of fruit: Fruit, by number: Int, from numberOfFruitExist: Int) {
        let valueAfterChange = numberOfFruitExist - number
        inventory[fruit] = valueAfterChange
        sendNotification(about: fruit, number: valueAfterChange)
    }
    
    // 재료 사용 함수 useIngredients
    private func useIngredients(accordingTo recipes: [(requiredFruit: Fruit, requestedAmount: Int)], checkAmountOfFruits: [Int]) {
        // 🔴
        for (index, fruitAmount) in checkAmountOfFruits.enumerated() {
            decreaseStock(of: recipes[index].requiredFruit, by: recipes[index].requestedAmount, from: fruitAmount)
        }
    }
    
    // 재고 체킹 함수 checkStock
    // amountOfFruitNow: 현재 과일의 수   amountRequired: 필요한 과일의 수
    private func checkStock(amountOfFruitNow: Int, amountRequired: Int) throws {
        guard amountOfFruitNow >= amountRequired  else {
            throw InventoryManagementError.inventoryError(description: InventoryManagementError.outOfStockMessage)
        }
    }
    
    // 
    private func giveBackNumberIfExist(_ fruit: Fruit) throws -> Int {
        guard let numberOfFruitExist = inventory[fruit] else {
            throw InventoryManagementError.inventoryError(description: InventoryManagementError.fruitThatDoesNotExistMessage)
        }
        return numberOfFruitExist
    }
    
    // 재료 체킹 함수 checkIngredients
    private func checkIngredients(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws -> [Int] {
        var numberOfFruitExist = [Int]()
        
        for demand in recipes {
            let numberOfFruit = try giveBackNumberIfExist(demand.requiredFruit)
            try checkStock(amountOfFruitNow: numberOfFruit, amountRequired: demand.requestedAmount)
            numberOfFruitExist.append(numberOfFruit)
        }

        return numberOfFruitExist
    }
    
    // 주스 produce 성공시 재고 소비, 에러뜨면 catch문으로
    func consumeStocks(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws {
        // 필요한 재료의 수량 체크해서 과일 몇개인지
        let amountOfFruit = try checkIngredients(recipes)
        
        useIngredients(accordingTo: recipes, checkAmountOfFruits: amountOfFruit)
    }
    
}

// 만들기    -> / 재고 소비       ->      재료 체크     (재고 체크)     -> 재료 사용        -> 재고 감소
// JuiceMaker /    FruitStore
// produce -> / consumeStocks -> checkIngredients (checkStock) -> useIngredients -> decreaseStock
