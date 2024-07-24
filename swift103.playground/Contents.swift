// 二進位數字類型 Int Float Double

// 類型數字範圍和精準度

print("Int 的最大值：\(Int.max)，最小值：\(Int.min)")

print(Double.greatestFiniteMagnitude)

// 判斷能不能顯示每個位數

// 為什麼運算一定要同類型

let x = 1 / 2
print(x)
let x1 = 1 / 2.0
print(x1)
let x2: Double = 1 / 2
print(x2)

let a = 1
let b = 2.0
print(Double(a) + b)

// 十進位數字類型 Decimal
import Foundation

//let decimal: Decimal = 1
//let decimal2 = Decimal(1)
//
//let decimal3: Decimal = 3.24
//print(decimal3)
//
//let decimal4 = Decimal(string: "3.24")!
//print(decimal4)


// 【ChaoCode】 Swift 基礎篇 3：數字類型實作作業

// 1. 請把台幣 975,772 元轉換成日幣，匯率是 1 台幣等於 3.95 日幣。
let NT: Decimal = 975772
let JP: Decimal = NT * 3.95
print("台幣 \(NT) 元等於日幣 \(JP) 元。")


// 2. 請印出十進位的 90000.23 用 Double 儲存會產生的誤差值。
// 答案可以是正數或負數，只要數字部分正確即可。
let decimal = Decimal(string: "90000.23")!
let doubleToDecimal = Decimal(90000.23)
let differences = decimal - doubleToDecimal

print(differences)
print("90000.23 用 Double 儲存會產生的誤差值為：\(differences)。")
