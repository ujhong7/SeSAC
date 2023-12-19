//
//  JuiceMaker.swift
//  JuiceMaker_Hong
//
//  Created by yujaehong on 12/4/23.
//

import Foundation

struct JuiceMaker {
    // 주스메이킹 결과
    enum JuiceMakingResult {
        case success(message: String)
        case failure(description: String)
    }
    
    // JuiceMaker는 FruitStore를 소유
    let fruitStore: FruitStore
    
    // 주스 제조
    func produce(_ menuName: JuiceMenu) -> JuiceMakingResult {
        let recipes = menuName.receiveRecipes()
        var outcomeCreated: JuiceMakingResult
        
        do {
            try fruitStore.consumeStocks(recipes)
            
            let completeOrderMessage = "나왔습니다! 맛있게 드세요!"
            outcomeCreated = .success(message: "\(menuName) \(completeOrderMessage)")
        } catch FruitStore.InventoryManagementError.inventoryError(let message) {
            outcomeCreated = .failure(description: message)
        } catch {
            outcomeCreated = .failure(description: "알수없는문제")
        }
        return outcomeCreated
    }
    
}
