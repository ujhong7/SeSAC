쥬스자판기 
23.12.04 ~ 12.21


1️⃣  **CaseIterable**, **CustomStringConvertible**
<img width="529" alt="image" src="https://github.com/ujhong7/SeSAC/assets/108393988/a57621ab-c7fc-426e-979b-4827605289d5">

1. **`enum Fruit: String, CaseIterable, CustomStringConvertible`**
    - **`enum Fruit`**은 과일을 나타내는 열거형입니다.
    - **`: String`**은 각 case의 raw value 타입이 문자열(String)임을 나타냅니다.
    - **`CaseIterable`**은 이 열거형이 **모든 case를 나타낼 수 있다**는 것을 의미합니다. 이 프로토콜을 채택하면 컴파일러가 자동으로 **`allCases`라는 속성을 생성**해줍니다.
2. **`CustomStringConvertible` 프로토콜**
    - **`CustomStringConvertible`**은 이 열거형이 **사용자가 읽기 쉬운 문자열 표현을 제공**할 수 있다는 것을 나타냅니다.
    - **`var description: String`**은 해당 열거형의 **각 case에 대한 사용자 정의 문자열을 반환하는 속성**입니다.

이 코드의 주요 포인트는 각 과일의 **`rawValue`**가 한글로 된 이름이며, **`CaseIterable`** 프로토콜을 사용하여 모든 case를 나타낼 수 있고, **`CustomStringConvertible`** 프로토콜을 사용하여 각 case에 대한 문자열 표현을 제공한다는 것입니다.

예를 들어, 다음과 같이 사용할 수 있습니다:

```swift
for fruit in Fruit.allCases {
    print(fruit) // 이 때, CustomStringConvertible 프로토콜에 의해 각 case의 한글 이름이 출력됨
}
```

또는 각 case를 문자열로 직접 사용할 수 있습니다:

```swift
let mango = Fruit.mango
print(mango.rawValue) // "망고"
print(mango) // CustomStringConvertible 프로토콜에 의해 "망고" 출력
```

---

2️⃣ **closure**, **reduce**

```swift
private(set) var inventory = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
      var bag = bag 
      let initialNumberOfFruits = 10
      bag[fruit] = initialNumberOfFruits 
      return bag 
```

1. **`Fruit.allCases.reduce([Fruit: Int]())`:**
    - **`Fruit.allCases`**는 **`Fruit`** 열거형의 모든 case를 배열로 반환합니다.
    - **`reduce`**는 컬렉션의 각 요소에 대해 제공된 클로저를 사용하여 **값을 누적하는 함수**입니다. 초기값은 빈 딕셔너리 **`[Fruit: Int]()`**로 설정합니다.
2. **`{ bag, fruit in ... }`:**
    - 이 클로저는 **`reduce`** 함수가 **반복**하면서 **각 요소에 대해 실행하는 코드 블록**입니다.
    - **`bag`**는 **누적된 값**, **`fruit`**는 현재 **순회 중인 과일**을 나타냅니다.
    
    **`reduce`** 함수의 클로저에서 **`bag`**는 누적된 값으로, 이 값은 **각 순회에서 계속 업데이트**되어 **최종적으로 반환**됩니다. 이때 **`bag`는 딕셔너리인 `[Fruit: Int]` 타입**입니다.
    
    처음에 **`reduce`** 함수에 전달한 초기값은 빈 딕셔너리 **`[:]`**이며, 각 순회에서 **`fruit`**라는 현재 순회 중인 과일을 기준으로 **`bag`** 딕셔너리에 새로운 **키-값 쌍이 추가되어 누적**됩니다.
    
    즉, 클로저에서 **`bag[fruit] = initialNumberOfFruits`** 부분이 누적된 값에 해당하며, 최종적으로 **`Fruit.allCases`**에 대한 모든 과일의 초기 재고가 포함된 딕셔너리가 반환되고, 이 값이 **`inventory`** 프로퍼티에 할당됩니다.
    
    <aside>
    💡 **클로저?**
    
    1. **`reduce`** 함수는 두 가지 인자를 받습니다. 첫 번째는 초기값으로 사용될 **`[Fruit: Int]`** 타입의 빈 딕셔너리이고, 두 번째는 클로저입니다.
    2. 클로저는 **`bag`**라는 이름의 변수와 **`fruit`**라는 매개변수를 가지고 있습니다. **`Fruit.allCases`**는 **`Fruit`** 열거형의 모든 케이스를 나타내며, **`reduce`** 함수는 이 케이스를 하나씩 꺼내면서 클로저를 실행합니다.
    3. **`bag`**는 누적된 값으로, 현재 과일(**`fruit`**)에 초기값(**`initialNumberOfFruits`**)을 할당하여 딕셔너리에 추가합니다. 이렇게 하면 각 과일의 초기 재고가 딕셔너리에 누적됩니다.
    4. 클로저의 반환 값은 **`return bag`**로, 이 값이 다음 순회에서 **`bag`**로 사용되어 누적됩니다.
    
    이러한 클로저를 사용함으로써 **`Fruit.allCases`**에 대한 초기 재고를 담은 딕셔너리를 만들게 됩니다.
    
    </aside>
    
3. **`var bag = bag`:**
    - 클로저 내에서 **`bag`**를 직접 변경할 수 없기 때문에 새로운 변수 **`bag`**에 현재 **`bag`** 값을 할당합니다. 이렇게 하면 클로저 내에서 **`bag`**를 수정할 수 있습니다.
4. **`let initialNumberOfFruits = 10`:**
    - 각 과일의 **초기 재고를 나타내는 값을 설정**합니다. 현재는 모든 과일에 대해 **초기값으로 10을 설정**하고 있습니다.
5. **`bag[fruit] = initialNumberOfFruits`:**
    - 현재 순회 중인 과일에 대한 딕셔너리에 초기 재고 값을 설정합니다.
6. **`return bag`:**
    - **클로저가 반환하는 값**은 **다음 순회에 사용될 누적값**입니다. 이 값은 **`reduce`** 함수에 의해 **각 순회마다 업데이트**되며, **최종적으로 `inventory` 프로퍼티에 할당**됩니다.

결과적으로, **`inventory`** 프로퍼티는 모든 과일에 대한 초기 재고를 담고 있는 딕셔너리가 됩니다. 이 딕셔너리는 **`private(set)`**으로 선언되어 있어 외부에서는 읽기만 가능하고 쓰기는 내부에서만 가능합니다.

**`private(set)`**은 속성의 **접근 제어 수준**을 설정하는데 사용되는 특별한 키워드입니다. 이것은 속성을 **외부에서 읽기만 허용**하고 **쓰기는 해당 타입 내부에서만 가능**하도록 만듭니다. 즉, **외부에서는 값을 읽을 수 있지만** **직접 변경할 수는 없습니다**. 클래스나 구조체 **내부에서는 읽기와 쓰기가 모두 가능**합니다.

<aside>
💡 **reduce**

**`reduce`** 함수는 컬렉션의 **각 요소를 순회**하면서 **해당 요소들을 결합**하여 **최종 결과를 얻는** 함수입니다. 주로 **컬렉션 내의 요소**들을 **누적하거나 결합**하는 데 사용됩니다.

**`reduce`** 함수의 일반적인 형태는 다음과 같습니다:

```swift
let result = initialResult.reduce { (accumulator, element) -> NewResultType in ... 
}
```

여기서:

- **`initialResult`**: **초기 결과 값**으로, 누적 연산을 시작할 때 사용됩니다.
- **`accumulator`**: 현재까지의 **누적 결과 값**으로, 초기에는 **`initialResult`**와 동일합니다.
- **`element`**: 컬렉션의 각 요소로, 현재 **순회 중인 요소**입니다.
- **`NewResultType`**: 연산 결과의 타입으로, 누적 결과의 형식을 나타냅니다.

이제 주어진 코드를 살펴보겠습니다:

```swift
private(set) var inventory = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
    var bag = bag // 클로저 내에서 값을 직접 변경할 수 없기 때문에 새로운 변수에 값을 할당
    let initialNumberOfFruits = 10
    bag[fruit] = initialNumberOfFruits // 현재 순회 중인 과일에 대한 재고를 딕셔너리에 추가합니다.
    return bag // 업데이트된 딕셔너리를 반환 -> reduce 함수는 이 반환값을 다음 순회에 사용하여 값을 누적합니다. -> inventory 프로퍼티에 할당되어 해당 과일의 초기 재고를 나타내게 됩니다.
}
```

- **`Fruit.allCases`**: **`Fruit`** 열거형의 모든 케이스를 나타내는 배열입니다.
- **`initialResult`**: **초기에 누적 결과**로 **빈 딕셔너리**인 **`[Fruit: Int]()`**를 사용합니다.
- **`accumulator`** (여기서는 **`bag`**): **딕셔너리의 현재 상태**로, 현재까지의 재고를 나타냅니다.
- **`element`** (여기서는 **`fruit`**): 현재 **순회 중인 과일**입니다.
- **`NewResultType`** (여기서는 **`[Fruit: Int]`**): 딕셔너리의 형식으로, **누적 결과의 형식**을 나타냅니다.

이 클로저는 각 과일에 대해 **초기 재고를 설정**하고, 이를 **누적하여 딕셔너리로 반환**합니다. 따라서 **`reduce`** 함수는 **모든 과일에 대한 초기 재고가 설정**된 **딕셔너리**를 생성하고, 이것이 **`inventory`** 프로퍼티에 할당되어 **초기 재고를 설정**합니다.

</aside>

---

3️⃣ **Notification**

```swift
JuiceMakingViewController {
// 수량 변화 옵저버
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
```

**JuiceMakingViewController:**

- **`registerObserver()`**: 이 메서드에서는 **`NotificationCenter`**에 옵저버를 등록합니다. 등록된 옵저버는 **`fruitsAmountDidChange`**라는 Notification이 발생했을 때 호출될 메서드를 지정합니다. 여기서는 **`didChangeFruitsAmount(_:)`** 메서드가 해당 Notification이 발생하면 호출되도록 등록되어 있습니다.
- **`didChangeFruitsAmount(_:)`**: 이 메서드는 **Notification이 발생했을 때 호출되는 메서드**로, **`userInfo`**를 통해 **전달된 사용자 정의 정보를 추출하여 처리**합니다. 여기서는 수량 변화에 따른 레이블의 변화를 처리하는 로직이 들어가 있습니다.
- **`turnOffObserver()`**: 이 메서드에서는 등록된 옵저버를 제거합니다. 이는 해당 객체가 더 이상 Notification을 받지 않도록 설정하는 역할을 합니다.

```swift
FruitSotre {
		// 수량 변화 옵저버 post
    private func sendNotification(about fruit: Fruit, number: Int) {
        NotificationCenter.default.post(name: Notification.Name("fruitsAmountDidChange"), object: nil, userInfo: [fruit: number])
    }
    
    // 재고 감소 함수
    private func decreaseStock(of fruit: Fruit, by number: Int, from numberOfFruitExist: Int) {
        let valueAfterChange = numberOfFruitExist - number
        inventory[fruit] = valueAfterChange
        sendNotification(about: fruit, number: valueAfterChange)
    }
}
```

**FruitStore:**

- **`sendNotification(about:number:)`**: 이 메서드는 **주어진 과일과 수량을 사용하여 `fruitsAmountDidChange`** **Notification을 post**합니다. 이로 인해 등록된 옵저버, 즉 JuiceMakingViewController의 **`didChangeFruitsAmount(_:)`** 메서드가 호출됩니다.
- **`decreaseStock(of:by:from:)`**: 이 메서드는 재고를 감소시키고, 감소된 값을 사용하여 **`sendNotification`**을 호출하여 **Notification을 발생**시킵니다.

---

4️⃣ **JuiceMakingViewController 에서 JuiceMaker 생성(선언)**

**`JuiceMaker`** 구조체는 **`FruitStore`**를 소유하고 있으며, 이를 초기화하기 위해 구조체의 생성자를 호출할 때 **`JuiceMakingViewController`**에서 **`JuiceMaker(fruitStore: FruitStore())`** 부분이 자동으로 추가됩니다.

자동으로 추가되는 이유는 **`JuiceMaker`** 구조체가 **`FruitStore`**를 소유하면서 초기화될 때, 해당 **소유하는 속성의 초기값을 설정하기 위함**입니다. 코드에서 **`JuiceMaker`**의 선언에서 **`let fruitStore: FruitStore`**로 선언되어 있으므로, 이 속성을 초기화하려면 초기값을 제공해주어야 합니다.

그래서 **`JuiceMaker(fruitStore: FruitStore())`** 부분은 **`JuiceMaker`** 구조체를 초기화하는데 필요한 **`FruitStore`**의 초기값을 제공하는 역할을 합니다. 만약 **`JuiceMaker`**의 초기값을 제공하지 않으면 컴파일러에서 오류를 발생시킬 것입니다.

---

5️⃣ **화면이동** 

```swift
func fruitInventoryDataToStockManagementViewController() {
        if let stockManagementVC = self.storyboard?.instantiateViewController(withIdentifier: "StockManagementViewController") as? StockManagementViewController {
            // 🔴 데이터 직접 넣어줌
            stockManagementVC.receivedFruitInventoryData = juiceMaker.fruitStore.inventory
            // 🔵 델리게이트 패턴
            stockManagementVC.delegate = self
   
            let stockManagementNavigationController = UINavigationController(rootViewController: stockManagementVC)
            self.present(stockManagementNavigationController, animated: true, completion: nil)
        }
    }
```

**`instantiateViewController(withIdentifier:)`** 메서드를 사용하고 있습니다. 여기서 사용된 화면 이동 방식은 "**Modal Presentation**"입니다.

1. **instantiateViewController(withIdentifier:):**
    - **`self.storyboard?.instantiateViewController(withIdentifier:)`**를 사용하여 스토리보드에서 "**StockManagementViewController**" **식별자를 가진 뷰 컨트롤러**를 **인스턴스화**합니다.
    - 이 메서드는 **스토리보드에서 지정된 식별자**에 해당하는 뷰 컨트롤러를 가져오는 역할을 합니다

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/eb8d5b3d-4890-46c5-ad1c-f468747d681d/0650a906-6552-497e-8983-90c7d9d3ddc2/Untitled.png)

1. **데이터 전달:**
    - **`stockManagementVC.receivedFruitInventoryData`**를 통해 생성된 **`StockManagementViewController`**의 프로퍼티에 **주스 메이커의 과일 재고 데이터**를 **직접 전달**합니다.
2. **델리게이트 패턴:**
    - **`stockManagementVC.delegate = self`**를 통해 **주스 메이킹 뷰 컨트롤러**를 **델리게이트로 설정**합니다. 이 델리게이트 패턴을 활용하여 화면 이동이 완료된 후, 재고 관리 화면에서 발생하는 이벤트나 데이터 변경을 주스 메이킹 뷰 컨트롤러에서 처리할 수 있도록 합니다.
3. **UINavigationController:**
    - **`UINavigationController`**을 생성하고, 이를 통해 **`stockManagementVC`**를 **네비게이션 스택에 추가**합니다.
    - **`stockManagementNavigationController`**는 **`stockManagementVC`**를 루트 뷰 컨트롤러로 가지며, **네비게이션 컨트롤러**를 통해 뷰 컨트롤러 간의 **스택 기반의 화면 전환**을 지원합니다.
4. **self.present(...):**
    - **`self.present(...)`**를 통해 **모달** 형태로 화면을 표시합니다.
    - 이 때, **`animated: true`**로 설정되어 있어 화면 전환 시 애니메이션 효과가 적용됩니다.

이 방식은 새로운 뷰 컨트롤러를 **현재 화면 위에 모달로 표시**하며, 사용자는 해당 화면을 확인하거나 닫을 수 있습니다.

---

6️⃣ **델리게이트 패턴을 사용한 데이터 전달**

```swift
protocol StockManagementViewControllerDelegate: AnyObject {
    func updateStockData(updatedData: [Fruit: Int])
}

class StockManagementViewController: UIViewController {
				...
				...

		@IBAction func doneButtonTapped(_ sender: Any) {
        print("완료버튼눌림")
        delegate?.updateStockData(updatedData: receivedFruitInventoryData)
        navigationController?.dismiss(animated: true, completion: nil)
    }

		weak var delegate: StockManagementViewControllerDelegate?

				...
				...
}
```

```swift
 JuiceMakingViewController: StockManagementViewControllerDelegate {
				...
		stockManagementVC.delegate = self // ✅
				...
    func updateStockData(updatedData: [Fruit : Int]) {
        showNumberOnLabel(fruits: updatedData)
        // 🔵 델리게이트 패턴 데이터 변경
        juiceMaker.fruitStore.updateInventory(updatedData)
    }
}
```

1. **프로토콜 정의:**
    - **`StockManagementViewControllerDelegate`** 프로토콜은 **쥬스 메이킹 뷰 컨트롤러가 채택**하는 프로토콜로, **재고 관리 뷰 컨트롤러에서 발생**한 **데이터 변경 이벤트를 처리**하기 위한 **규약**을 정의합니다.
2. **StockManagementViewController 클래스:**
    - **`StockManagementViewController`**는 완료 버튼이 눌렸을 때, **델리게이트에게 데이터를 전달**하고, 모달로 표시된 화면을 닫는 역할을 합니다.
3. **JuiceMakingViewController 클래스:**
    - **`JuiceMakingViewController`**는 **`StockManagementViewControllerDelegate`** **프로토콜을 채택**하여, 델리게이트로 등록되어 **데이터 변경 이벤트를 수신 ✅**할 수 있습니다.
4. **데이터 전달 과정:**
    - 사용자가 **`StockManagementViewController`**에서 완료 버튼을 누르면, **`doneButtonTapped(_:)`** 메서드가 호출됩니다.
    - 이때, 해당 뷰 컨트롤러에 등록된 델리게이트인 **`JuiceMakingViewController`**의 **`updateStockData(updatedData:)`** 메서드가 호출되어 데이터를 전달하고, 주스 메이커의 재고를 업데이트합니다.

이러한 구조를 통해 데이터의 **단방향 전달**이 이루어지며, **`JuiceMakingViewController`**는 **`StockManagementViewController`**에서 발생한 데이터 변경 **이벤트를 적절히 처리**할 수 있습니다.

---

7️⃣ **주문버튼** 

```swift
struct JuiceMaker {
    ...
		let fruitStore: FruitStore

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
```

- **`produce(_:)`** 메서드는 주스를 제조하는 역할을 합니다. **`JuiceMenu`**를 받아 해당 메뉴의 레시피를 받아오고, **`FruitStore`**의 재고를 소비하면서 제조를 시도합니다.
- 소비에 성공하면 성공 메시지를, 실패하면 실패 메시지를 반환합니다.

```swift
 JuiceMakingViewController {
    func setUpTargetActionOnButtons() {
        orderStrawberryButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderPineAppleButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderStrawberryBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for:.touchUpInside)
        orderMangoKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
    }
    
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
        
        self.present(generateAlert(by: result), animated: true, completion: nil)
    }
   
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
```

**`sender`**는 주로 **이벤트가 발생한 객체**를 나타내는 **매개변수**입니다. 이벤트가 발생한 객체, 즉 사용자와 상호작용을 하는 UI 요소 (예: 버튼, 텍스트 필드 등) 중 어떤 객체에서 이벤트가 발생했는지를 가리킵니다.

예를 들어, 버튼을 눌렀을 때 실행되는 액션 메서드에서 **`sender`**는 그 **버튼**을 나타냅니다. 이를 활용하면 여러 버튼이 동일한 액션 메서드를 공유하면서 각각 다르게 동작할 수 있습니다. 코드에서 **`switch sender`** 부분은 **어떤 버튼이 눌렸는지에 따라 다르게 동작**하도록 설정한 부분입니다.

1. **orderJuice 함수:**
    - **동작:** 사용자가 주스를 **주문하는 버튼을 누를 때** 호출되며, 해당 주스의 종류에 따라 JuiceMaker에서 주스를 제조합니다.
    - **매개변수:** 눌린 버튼 (**`sender: UIButton`**)
    - **주요 로직:**
        - 눌린 버튼에 따라 어떤 종류의 주스를 만들지 결정합니다.
        - JuiceMaker의 **`produce`** 메서드를 호출하여 해당 주스를 제조하고 그 결과를 **`result`**에 저장합니다.
        - **`generateAlert`** 메서드를 호출하여 주스 제조 결과에 따른 알림창을 생성합니다.
        - 생성된 알림창을 현재 뷰 컨트롤러에 표시합니다.
2. **generateAlert 함수:**
    - **동작:** JuiceMaker에서 **주스 제조 결과를 받아** 그에 맞는 알림창을 생성합니다.
    - **매개변수:** JuiceMaker의 주스 제조 결과 (**`result: JuiceMaker.JuiceMakingResult`**)
    - **주요 로직:**
        - 주스 제조 **결과에 따라 성공인 경우와 실패**인 경우로 나뉩니다.
        - 성공인 경우: 주문한 주스가 성공적으로 제조되었다는 메시지를 표시하는 알림창을 생성합니다.
        - 실패인 경우: 주문한 주스를 제조할 수 없는 실패 사유에 대한 메시지를 표시하는 알림창을 생성합니다. 이때 실패 사유에 따라 "예" 버튼을 누르면 재고를 수정할 수 있는 StockManagementViewController로 이동하도록 설정하고, "아니오" 버튼을 누르면 단순히 알림창을 닫도록 합니다.
        - 생성된 알림창을 반환합니다.

---

8️⃣ **클래스/구조체 선택이유**

**`JuiceMaker`**이 구조체로, **`FruitStore`**가 클래스로 구현된 이유:

1. **값 복사 대 참조 복사:**
    - **JuiceMaker (Struct):** **`JuiceMaker`**는 값 복사를 가지는 것이 적합한 것으로 보입니다. **값 복사는 인스턴스를 전달할 때 해당 인스턴스의 사본을 원할 때** 사용됩니다. 이는 각 코드 부분이 독립적인 복사본과 작업하도록 보장하며, **인스턴스가 비교적 작고 불변**일 때 적합합니다.
    - **FruitStore (Class):** **`FruitStore`**는 참조 복사를 가지는 경우가 많습니다. 여러 부분에서 동일한 인스턴스를 참조하려면 참조 복사가 필요합니다. **여러 부분에서 인벤토리에 액세스해야 하는 경우** 클래스를 사용하면 같은 인스턴스를 참조할 수 있습니다.
2. **불변성:**
    - **JuiceMaker (Struct):** **구조체**는 일반적으로 **불변성이 권장되는 상황에 적합**합니다. **`JuiceMaker`** 인스턴스가 생성 후에 변경되지 않아야 하는 경우 구조체를 사용하면 모든 속성이 상수로 만들어 불변성을 강제할 수 있습니다.
    - **FruitStore (Class):** **클래스**는 참조 타입으로 불변성에 대한 제약이 덜합니다. **인벤토리 상태를 시간이 지남에 따라 수정**해야 하는 경우 클래스를 사용하면 더 많은 유연성을 얻을 수 있습니다.
3. **복사:**
    - **JuiceMaker (Struct):** **`JuiceMaker`**가 구조체이므로 **함수에 전달하거나 변수에 할당할 때 사본이 생성**됩니다. **한 인스턴스의 변경이 다른 인스턴스에 영향을 미치지 않도록 보장**하는 데 유용합니다.
    - **FruitStore (Class):** 클래스는 참조 타입이므로 인스턴스를 전달할 때 해당 인스턴스의 참조가 전달됩니다. **공유 상태나 객체가 큰 경우 클래스를 사용하면 효율적**일 수 있습니다.

**`JuiceMaker`**와 **`FruitStore`**가 각각 구조체와 클래스로 구현된 이유는 애플리케이션의 특정 요구사항과 원하는 동작에 따라 다릅니다. 불변성, 복사, 참조 복사 등의 요소를 고려하여 결정하는 것이 좋습니다.

---

9️⃣ **타입의 캡슐화/은닉화**

**캡슐화 (Encapsulation):**

캡슐화는 **객체의 속성과 행위를 하나로** 묶고, **외부에서 직접 접근하지 못하도록 은닉**하는 것을 말합니다. 

1. **속성 은닉화:**
    - **`private(set) var inventory = Fruit.allCases.reduce([Fruit: Int]())`**: **`inventory`** 속성은 **`private(set)`** 키워드로 선언되어 있어 **외부에서는 읽기만 가능**하고, **쓰기는 내부에서만 가능**합니다. 이로써 외부에서 **무분별하게 값을 변경하지 못하게** 합니다.
2. **메서드 은닉화:**
    - **`sendNotification`**, **`decreaseStock`**, **`useIngredients`**, **`checkStock`**, **`giveBackNumberIfExist`** 등의 메서드는 **내부에서만 사용되는 메서드**로, **외부에서는 직접 호출되지 않습니다**. 이러한 메서드들은 **객체 내부에서만 동작하도록 설계**되어 있습니다.

**은닉화 (Abstraction):**

은닉화는 **사용자에게 필요한 정보만을 제공**하고 **내부의 복잡한 동작을 감추는 것**을 의미합니다. 

1. **에러 메시지 은닉화:**
    - **`InventoryManagementError`** 열거형은 내부적으로 사용되는데, **외부에서는 에러 메시지의 구체적인 내용을 알 필요가 없습니다**. 따라서 **구체적인 에러 메시지는 감추고**, **추상화된 에러 타입을 제공**함으로써 외부 코드에 **불필요한 정보를 노출시키지 않습니다**.
2. **구현 세부사항 은닉화:**
    - **`reduce`** 함수를 이용하여 **`inventory`** 초기화하는 부분이 **내부적으로 구현**되어 있습니다. 외부에서는 이 부분의 **세부적인 동작에 대해 알 필요가 없고**, 추상화된 인터페이스에만 의존할 수 있습니다.

**캡슐화와 은닉화의 필요성:**

1. **모듈성 향상:**
    - 객체 내부의 구현 세부사항이나 **복잡한 동작을 감추면**, **객체 간의 의존성이 낮아져서** **모듈성이 향상**됩니다. **한 모듈을 수정하더라도 다른 모듈에 미치는 영향이 적어집니다**.
2. **유지보수성 증가:**
    - **외부에서** **직접적인 접근이 제한**되면, **내부 구현을 변경할 때** **외부 코드에 영향을 덜 미치게** 되어 유지보수가 쉬워집니다.
3. **보안 강화:**
    - 은닉된 정보는 외부로 노출되지 않기 때문에 **보안이 강화**됩니다. 중요한 데이터나 동작을 외부로부터 숨길 수 있습니다.

캡슐화와 은닉화는 객체 지향 프로그래밍의 핵심 개념으로, 코드의 **안정성**과 **유지보수성**을 높이는 데 기여합니다.
