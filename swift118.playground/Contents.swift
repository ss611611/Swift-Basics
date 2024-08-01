// Function

//func 算年紀(_ 出生年: Int, 判斷年份: Int = 2022) -> Int {
//    判斷年份 - 出生年
//}
//
//let 我的年紀 = 算年紀(1987)
//let 媽媽的年紀 = 算年紀(1963)
//let 爸爸年紀 = 算年紀(1962)
//let 女兒年紀 = 算年紀(2015)


//let 記帳 = [100, 200, 50, 80, 32, 111, 2831]
//
////func 加總(_ 資料: [Int]) -> Int {
////    var total = 0
////    for cost in 資料 { total += cost }
////    
////    return total
////}
////print("總花費 \(加總(記帳))")
////print(加總([3, 7, 100]))
//
//func 加總<T: AdditiveArithmetic>(_ 資料: [T]) -> T {
//    var total: T = .zero
//    for cost in 資料 { total += cost }
//
//    return total
//}
//
//func 加總<T: AdditiveArithmetic>(_ 資料: T...) -> T {
//    加總(資料)
//}
//print("總花費 \(加總(記帳))")
//print(加總([3, 7, 100]))
//print(加總(3))
//print(加總(3, 7, 100))
//print(加總(3, 7.2, 100))


// 【ChaoCode】 Swift 基礎篇 18：Function 實作作業
//
//
// 1. 請根據下列規則設計判斷生肖的 Function。
//      a. 單純用陽曆過年判斷，不考慮農曆。
//      b. 請設計兩個名字都是「查生肖」的 Function。
//      c. 一個需要名為「西元年」的 Int 屬性參數；另一個需要名為「國曆年」的 Int 屬性參數。
//      d. 兩個 Function 的回傳值都是 String，也就是對應的生肖。



func 查生肖(西元年: Int) -> String {
    let 生肖 = ["猴", "雞", "狗", "豬", "鼠", "牛", "虎", "兔", "龍", "蛇", "馬", "羊"]
    return 生肖[(西元年) %  12]
}

func 查生肖(國曆年: Int) -> String {
    查生肖(西元年: 1911 + 國曆年)
}




// 👆 在上面寫完你的 Function 後請 Uncomment 下面這行進行測試，請勿更改任何內容，如果無法執行表示你的 Function 設計不正確。
 生肖測試(西元年: 查生肖(西元年:), 國曆年: 查生肖(國曆年:))

// 2. 請根據下面規則設計數字相乘的 Function。
//      a. Function 名稱為「相乘」。
//      b. Function 接受兩個參數，兩個參數在呼叫使用時都不需要輸入標籤。
//      c. 兩個參數都「必須要」能接受「Int、Double、Decimal」任何一種數字類型並回傳 Double。你可以用設計多個同名稱的 Function 來解決這個問題。
//      d. 計算方法是把兩個數字都先都轉成 Double 後再相乘。
// 💡 如果你想對 Generic 設定一個以上的 Protocol 的話，可以用 & 區分。例如：Element: Hashable & Comparable。
// 💡 如果需要的話，Google 文件上還有其他提示。



// 定義了一個泛型函數 "相乘"，它接受兩個參數 a 和 b。參數 a 的類型是 Number，參數 b 的類型是 Multiple。這兩個類型都必須遵循 Numeric 和 CustomStringConvertible 協議。
func 相乘<Number: Numeric & CustomStringConvertible,
          Multiple: Numeric & CustomStringConvertible>(_ a: Number, _ b: Multiple) -> Double {
    // 將 a 和 b 的 description 屬性轉換為字串，再將字串轉換為 Double 型別，並進行乘法運算，最終返回一個 Double 型別的結果。
    Double(a.description)! * Double(b.description)!
}







// 👆 在上面寫完你的 Function 後請 Uncomment 下面「全部」內容進行測試，請勿更改任何內容，如果無法執行表示你的 Function 設計不正確。

resetCounter()
for index in 0...4 {
    secondTest(相乘(intNumbers[index], intNumbers[index]))
    secondTest(相乘(doubleNumbers[index], doubleNumbers[index]))
    secondTest(相乘(decimalNumbers[index], decimalNumbers[index]))
    for index2 in 0...4 {
        if (index != index2) {
            secondTest(相乘(intNumbers[index], intNumbers[index2]))
            secondTest(相乘(doubleNumbers[index], doubleNumbers[index2]))
            secondTest(相乘(decimalNumbers[index], decimalNumbers[index2]))
        }

        secondTest(相乘(intNumbers[index], doubleNumbers[index2]))
        secondTest(相乘(intNumbers[index], decimalNumbers[index2]))
        secondTest(相乘(doubleNumbers[index], intNumbers[index2]))
        secondTest(相乘(doubleNumbers[index], decimalNumbers[index2]))
        secondTest(相乘(decimalNumbers[index], intNumbers[index2]))
        secondTest(相乘(decimalNumbers[index], doubleNumbers[index2]))
    }
}

print("✅ 您的相乘 function 沒有問題")
