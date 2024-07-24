// 數學運算子：加 減 乘 除 餘數
// 空白鍵分隔 & 數學運算必須是同類型
1 + -2
9 - 1
3 * 6
8 / 2
3 % 4


// 與等號結合
var number = 0
number = number + 5
number += 5
number += number

number -= 5
number *= 2
number /= 3
number %= 3

// 除法注意事項
// 整數相除結果無條件捨去
100 / 20
100 / 30
100 / 27


// 【ChaoCode】 Swift 基礎篇 2：數學運算子實作作業

// 1. 請完成這組這個計算年紀 code（不考慮幾月生，2021 年生的話就是 1 歲）
let currentYear = 2022
let birthYear   = 1998
let age         = currentYear - birthYear

print("\(birthYear) 年生的孩子今年 \(age) 歲了")

// 2. 請把華氏溫度 100 轉換成攝氏，並把你的變數放入提供的 print 字串中。（答案應為 37 度）
// 轉換公式 = (華氏溫度 - 32) * 5 / 9
var f = 100
let c = (f - 32) * 5 / 9
print("華氏溫度 \(f) 度大約是攝氏溫度 \(c) 度")


// 3. 請找出大於 300 並且是 11 的倍數的「最小」數字。（答案應為 308）
// 下面提供的變數名稱是 minNumber（最小數字）和 factor（因數），但你可以隨意調整，記得把 print 裡的變數名稱也改掉就好。
let minNumber = 300
let factor    = 11
let answer = minNumber + factor - (minNumber % factor)

print("大於 \(minNumber) 並且是 \(factor) 的倍數的最小數字是 \(answer)")
