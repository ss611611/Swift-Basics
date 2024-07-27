// Range 運算子

// 建立 Range
//let range = 3..<6

// 建立 ClosedRangeFrom
let ClosedRange = 3...6

// 建立 PartialRangeFrom
let r1 = 3...
let r2 = ...3
let r3 = ..<3

// 屬性
//let range = 0...3
//
//print("是空的嗎？ \(range.isEmpty)")
//print("範圍內的數量： \(range.count)")
//print("第一個值： \(range.first)")
//print("最後一個值： \(range.last)")
//print("下限： \(range.lowerBound)")
//print("上限：\(range.upperBound)")

// 方法

//let range = "a"..."d"
//let result = range.contains("e")
//
//print("\(range) 是否包含某個值？")
//print(result)

//let range = 1...5
//let result = range.randomElement()
//
//print("\(range) 中取一個隨機值")
//print(result!)
//print(range.randomElement()!)
//print(range.randomElement()!)
//print(range.randomElement()!)
//print(range.randomElement()!)


//let range = 1...5

//print(range.overlaps(5...20))
//print(range.overlaps(5..<20))

//let range = 1..<5
//let closedRange = 1...5
//
//print(range.clamped(to: 6..<20))
//print(closedRange.clamped(to: 6...20))


import Foundation

// 【ChaoCode】 Swift 基礎篇 10：Range 運算子實作作業
//
// 1. 保羅在學校活動的時間是 7:00~13:00 點，艾莉在學校活動的時間是 12:30~17:00 點，溫蒂在學校活動的時間是 10:00~16:00 點，他們有辦法在學校碰面嗎？如果可以的話是幾點到幾點？
// ⚠️ 嘗試用下面提供的 formatter 讓你的數字一律印出兩位數，比方 1 應該印出 01。請用這種一律有兩位數的顯示方式來印出時間。例如 1 點 5 分應該是 01 點 05 分。
let formatter = NumberFormatter()
formatter.minimumIntegerDigits = 2
let bol = 700..<1300
let al = 1230..<1700
let wind = 1000..<1600
let commonTime = bol.clamped(to: al).clamped(to: wind)
if (commonTime.first == commonTime.last) {
    print("不能碰面")
} else {
    typealias time = (hour: Int, min: Int)
    let startTime: time = (commonTime.lowerBound / 100, commonTime.lowerBound % 100)
    let endTime: time = (commonTime.upperBound / 100, commonTime.upperBound % 100)
    let startTimeString = formatter.string(for: startTime.hour)! + ":" + formatter.string(for: startTime.min)!
    let endTimeString = formatter.string(for: endTime.hour)! + ":" + formatter.string(for: endTime.min)!
    print("他們可以在 \(startTimeString) ~ \(endTimeString) 之間碰面")
}



print("---------------------")
// 2. 請設計一個隨機抽獎活動，每次執行時會從 1 到 1000 隨機抽一個數字。如果這個數字在 100 ~ 200 的範圍中（不含 200）則中 200 元；如果這個數字尾數是 8 或 6 則中 500 元；如果這個數字剛好是 888 或 666 則中 10,000 元。

func 抽獎活動(自選隨機數字: Int? = nil)
{
    var 隨機數字: Int = (1...1000).randomElement()! // ⚠️ 請勿改變數名稱，只修改 ? 的部分，? 必須是隨機產生的數字。
    隨機數字 = 自選隨機數字 ?? 隨機數字 // ⚠️ 請勿刪掉這行，測試用
    print("您抽中的數字是：\(隨機數字)", terminator: "，")
    
    let mantissa = 隨機數字 % 10

    if (隨機數字 == 666 || 隨機數字 == 888) {
        print("🎉 恭喜你中了 10,000 元！")
    } else if (mantissa == 6 || mantissa == 8) {
        print("🎉 恭喜你中了 500 元！")
    } else if ((100..<200).contains(隨機數字)) {
        print("🎉 恭喜你中了 200 元！")
    } else {
        print("很可惜，這次沒有中獎。")
    }
}

抽獎活動(自選隨機數字: 1)
抽獎活動(自選隨機數字: 100)
抽獎活動(自選隨機數字: 116)
抽獎活動(自選隨機數字: 239)
抽獎活動(自選隨機數字: 200)
抽獎活動(自選隨機數字: 344)
抽獎活動(自選隨機數字: 246)
抽獎活動(自選隨機數字: 666)
抽獎活動(自選隨機數字: 888)
抽獎活動(自選隨機數字: 777)
抽獎活動(自選隨機數字: 150)
抽獎活動()

