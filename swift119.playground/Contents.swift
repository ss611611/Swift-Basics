// Closure

//typealias 水果 = (name: String, price: Double)
//
//let fruits: [水果] = [("蘋果", 40), ("香蕉", 10), ("奇異果", 15), ("水梨", 69), ("葡萄", 99)]
//
////let sortedFruits = fruits.sorted { $0.price > $1.price }
//let sortedClosure = { (a: 水果, b: 水果) -> Bool in
//    a.price > b.price
//}
//
//let sortedFruits = fruits.sorted (by: sortedClosure)
//
//
//
//print(sortedFruits)




// 【ChaoCode】 Swift 基礎篇 19A：Closure 實作作業
//
// ⚠️ 請在不使用 Loop 語法的情況完成這次的每一項作業。
//
// 1. 請把箱子由大到小堆疊，從最下面開始，先放最寬的箱子，如果遇到寬度一樣箱子則先放較厚的箱子。
// ＊Box 是一個有寬度（width）和高（height）的 Tuple。
// 👇 請把這疊箱子改成從大到小排序。（也就是要放在下面的應在 Array 前面。）
let boxes: [Box] = [(2, 1), (1, 1), (4, 1), (6, 1), (4, 3)]
let boxSortW = { (a: Box, b: Box) -> Bool in
    if a.width > b.width {
        return true
    }
    return a.width == b.width && a.height > b.height
}
let sortedBox = boxes.sorted(by: boxSortW)
print("排序後的箱子順序是 \(boxSortW)")
// 你可以使用下面這個 function 印看看箱子疊起來的樣子。
drawBoxes(boxes)


// 👇 上面的 box 排序成功後，請呼叫「箱子疊疊樂」function，這個 function 會用你提供的排序方式重新排列 13 組箱子，請用和第一題同樣的規則來重新排列這些箱子。
// 如果不確定為什麼不對的話，也可以自己使用上面的 drawBoxes() 來看看有什麼不一樣。
箱子疊疊樂(排序: boxSortW)

// 2. 請設計一個把一組撲克牌組按照「大老二」大小規則，由大到小重新排序，並回傳排序後的牌組的 Function。
// 大小規則：先比數字大小，假如同大小的話再比花色。
// ＊號碼大小：2 > A > K > Q > J > 10 > 9 > 8 > 7 > 6 > 5 > 4 > 3
// ＊花色大小：黑桃 > 紅心 > 方塊 > 梅花
// 💡 你可以設計一個幫助你對照大小的 Dictionary。
// 你的 function 應接收一個「撲克牌的 Array」並回傳一個「撲克牌的 Array」
// ＊撲克牌是 (花色: String, 號碼: String) 的別稱。

// 定義一個名為 "sort" 的函數，接受一個撲克牌陣列參數 "cards"，並返回一個已排序的撲克牌陣列。
func sort(_ cards: [撲克牌]) -> [撲克牌] {
    // 定義一個字典 "sizeRef"，用來將撲克牌的號碼和花色映射到對應的數值。這些數值將用來比較和排序撲克牌。
    let sizeRef = ["3": 0, "4": 1, "5": 2, "6": 3, "7": 4, "8": 5, "9": 6, "10": 7, "J": 8, "Q": 9, "K": 10, "A": 11, "2": 12, "黑桃": 3, "紅心": 2, "方塊": 1, "梅花": 0]
    // 使用 sorted 方法對 "cards" 陣列進行排序。排序的依據由後面的大括號中的閉包決定。
    return cards.sorted {
        // 將撲克牌 $0 的花色和號碼映射到對應的數值，並存儲在元組 "a" 中。
        let a = (花色: sizeRef[$0.花色]!, 號碼: sizeRef[$0.號碼]!)
        // 將撲克牌 $1 的花色和號碼映射到對應的數值，並存儲在元組 "b" 中。
        let b = (花色: sizeRef[$1.花色]!, 號碼: sizeRef[$1.號碼]!)
        // 使用 switch 語句來比較撲克牌的號碼。
        switch a.號碼 {
            // 如果 a 的號碼大於 b 的號碼，則 a 應該排在 b 之前。
            case (b.號碼 + 1)...:
                return true
            // 如果 a 和 b 的號碼相同，則比較它們的花色。
            case b.號碼:
                return a.花色 > b.花色
            // 如果 a 的號碼小於或等於 b 的號碼，則 a 不應該排在 b 之前。
            default:
                return false
        }
    }
}

// 👇 請呼叫「大老二排序測試」這個 function 測試你的 function。你會需要把你設計的 function 當作引數丟進去。
大老二排序測試(sort)

