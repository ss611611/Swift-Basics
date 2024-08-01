// Closure: 高階函式 High Order Function
typealias fruit = (name: String, price: Double)

let fruits: [fruit] = [("蘋果", 40), ("香蕉", 10), ("奇異果", 15), ("水梨", 69), ("葡萄", 99)]

let sortFruit = fruits.sorted { a, b in a.price > b.price }

// .map

//let fruitStringArray = sortFruit.map { fruit in
//    return "\(fruit.name) \(fruit.price) 元"
//}
//print(fruitStringArray)



// .reduce

//let totalFee = sortFruit.reduce(0) { total, fruit in
//    total + fruit.price
//}
//
//print("總費用 \(totalFee)")


// .filter

//let nobleFruit = sortFruit.filter { fruit in
//    fruit.price > 50
//}
//print(nobleFruit)


// .contains

//print(fruits.contains { (name, _) in
//    name == "香蕉"
//})




// 【ChaoCode】 Swift 基礎篇 19B：Closure 實作作業
//
// ⚠️ 請在不使用 Loop 語法的情況完成這次的每一項作業。
//
// 1. 請計算持有股票的總資產價值，計算方式為單股價格 * 持有股數。
typealias 股票 = (name: String, 單股價格: Double, 持有股數: Int)
let 持有股票: [股票] = [("台積電", 575.5, 1000), ("長榮航", 36.425, 7820), ("中鋼", 39.55, 5500), ("台泥", 47.95, 13600), ("元大台灣50", 135.15, 8000)]
let totalMoeny = 持有股票.reduce(0) { total, stock in
    total + (stock.單股價格 * Double(stock.持有股數))
}

print("💰 股票總資產價值為 \(totalMoeny) 元")


// 2. 請透過 getTeamRecords() 取得 NBA 球隊資料，並回答以下問題。
//    * getTeamRecords() 的回傳值是一個 [Team]，Team 是 (隊伍名: String, 勝場數: Int, 敗場數: Int, 分區: String) 的別稱。
func getWinningRate(_ team: Team) -> Double {
    Double(team.勝場數) / (Double(team.勝場數) + Double(team.敗場數))
}

let teams = getTeamRecords()
// a. 請使用 .reduce 找出東區勝率最高的球隊。

// 使用 getTeamRecords() 函數獲取所有球隊的記錄，並使用 .reduce 方法來找出東區勝率最高的球隊。
// 初始值為一個默認的 Team，其中隊伍名為空字符串，勝場數和敗場數都為 0，分區為空字符串。
let winner = teams.reduce(Team("", 0, 0, "")) {
    // 如果當前處理的球隊分區不是 "東區"，則返回累加器 $0。
    if ($1.分區 != "東區") { return $0 }
    // 比較當前累加器球隊 ($0) 和當前處理的球隊 ($1) 的勝率。
    return getWinningRate($0) > getWinningRate($1) ? $0 : $1
}

print("🏆 東區勝率最高的隊伍是：\(winner.隊伍名)")


// b. 請使用 .contains 找出東區和西區個別是否有勝率低於 25%（含）的隊伍。
let eastResult = teams.contains { $0.分區 == "東區" && getWinningRate($0) < 0.25 } ? "有" : "沒有"
let westResult = teams.contains { $0.分區 == "西區" && getWinningRate($0) < 0.25 } ? "有" : "沒有"

print("🏀 東區和西區個別是否有勝率低於 25% 的隊伍？  東區\(eastResult)，西區\(westResult)")

// c. 請整理出一個「只有勝率至少有 60% 的隊伍」的 Array，Array 裡面的每筆資料是「隊伍名稱和勝率的 Tuple」，並將 Array 照勝率從高到低排序後印出。
// * 請把勝率 * 100 並轉成 Int，例如 0.52398 應轉為 52。

// 使用 map 方法將 teams 陣列中的每個元素轉換成一個元組，包含隊伍名和勝率的整數百分比（乘以 100 並轉換為 Int 型別）
let winnerTeams = teams.map { ($0.隊伍名, Int(getWinningRate($0) * 100)) }
// 使用 filter 方法過濾掉勝率百分比小於 60 的隊伍，只保留勝率百分比大於或等於 60 的隊伍
    .filter { $0.1 >= 60 }
// 使用 sorted 方法根據勝率百分比從高到低對隊伍進行排序
    .sorted { $0.1 > $1.1 }

print("💪 勝率 60 % 以上（含）的隊伍")
print(winnerTeams)
