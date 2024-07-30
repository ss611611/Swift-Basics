// Set

// 基本操作：建立、新增、刪除

//var set: Set<String> = []
//let set2 = Set<Int>()
//let set3 = Set(["蘋果"])

//var set: Set<String> = []
//set.insert("蘋果")
//print(set)
//set.update(with: "香蕉")
//print(set)
//set.insert("蘋果")
//set.update(with: "香蕉")
//print(set)
//
//set.remove("蘋果")
//set.remove("蘋果")
//set.remove("蘋果")
//set.removeAll()
//print(set)

//let array = ["香蕉", "蘋果", "香蕉"]
//let set = Set(array)
//print(set)

//let 目的地: Set<String> = ["東京", "大阪", "北海道", "首爾", "上海", "長灘島", "香港", "普吉島", "曼谷", "會安", "宿霧", "新加坡", "吉隆坡", "清邁", "沖繩", "沙巴"]
//let 爸爸: Set<String> = ["上海", "清邁", "沖繩", "沙巴"]
//let 媽媽: Set<String> = ["會安", "清邁", "沖繩", "北海道"]
//let 女兒: Set<String> = ["東京", "首爾", "曼谷", "沖繩"]
//let 兒子: Set<String> = ["大阪", "香港", "沖繩", "曼谷"]
//
//// 爸爸跟媽媽都想去的地方
//爸爸.intersection(媽媽)
//
//// 爸爸想去但媽媽不想去的地方
//爸爸.subtracting(媽媽)
//媽媽.subtracting(爸爸)
//爸爸.symmetricDifference(媽媽)
//
//// 大家都想去的地方
//爸爸.intersection(媽媽).intersection(女兒).intersection(兒子)
//
//// 至少有一個人想去的地方
//let 至少有一個人想去 = 爸爸.union(媽媽).union(女兒).union(兒子)
//print(至少有一個人想去.count)
//
//// 沒有人想去的地方
//目的地.symmetricDifference(至少有一個人想去)
//目的地.subtracting(至少有一個人想去)



//struct Fruit: Hashable, Equatable, CustomStringConvertible {
//    var name: String
//    var description: String { self.name }
//    func hash(into hasher: inout Hasher) {
//        
//    }
//    
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.name == rhs.name
//    }
//}
//
//var fruits = Set<Fruit>()
//
//
//let apple = Fruit(name: "蘋果")
//let banana = Fruit(name: "香蕉")
//
//print("Hash 值是否一樣？ \(apple.hashValue == banana.hashValue)")
//print("兩個值是否相等？ \(apple == banana)")
//
//fruits.insert(apple)
//fruits.insert(banana)
//print(fruits)







// 【ChaoCode】 Swift 基礎篇 15：Set 實作作業
//
//
// 1. 以下是一個班級的模擬考的結果，請印出全班人數、兩科都 Pass 的有幾人以及他們的名字。
//英文 Pass："菲尼克斯", "安東尼", "伊恩", "羅恩", "約翰", "黛西", "格理芬", "凱登", "麥可", "傑克森", "約瑟夫", "艾斯", "諾亞", "約拿", "埃利奧特", "凱勒", "雅莉安娜", "凱特"
//數學 Pass："潔西卡", "諾亞", "雅莉森", "凱特", "黛西", "伊恩", "賈斯丁", "艾米", "羅恩", "以賽亞", "達克斯", "伊萊賈", "雅莉安娜", "約翰", "昆恩"
//都沒 Pass 的有："戴蒙", "雷蒙", "艾莉克西雅", "菲碧"

let englishPass: Set<String> = ["菲尼克斯", "安東尼", "伊恩", "羅恩", "約翰", "黛西", "格理芬", "凱登", "麥可", "傑克森", "約瑟夫", "艾斯", "諾亞", "約拿", "埃利奧特", "凱勒", "雅莉安娜", "凱特"]
let mathPass: Set<String> = ["潔西卡", "諾亞", "雅莉森", "凱特", "黛西", "伊恩", "賈斯丁", "艾米", "羅恩", "以賽亞", "達克斯", "伊萊賈", "雅莉安娜", "約翰", "昆恩"]
let noPass: Set<String> = ["戴蒙", "雷蒙", "艾莉克西雅", "菲碧"]
let totalPeople: Set<String> = []
totalPeople.union(englishPass).union(mathPass).union(noPass)
let doublePass: Set<String> = englishPass.intersection(mathPass)

print("全班一共有 \(totalPeople.count) 人")
print("兩科都 Pass 的有 \(doublePass.count) 人，他們是：\(doublePass.joined(separator: "、"))")


// 2. 請寫一個簡單版的狼人殺遊戲。12 個人被分為狼人隊伍和村民隊伍，每天早上會從全部的人中隨機流放一人，而晚上會從村民中隨機送走一人。重複這個流程直到其中一個隊伍內所有人都離開，剩餘還有人的那一隊獲勝。最後請印出花了多少天、哪一個隊伍獲勝以及倖存者姓名。
// * 第一天是從晚上開始，接著就是第二天白天。
// * 如果白天只剩下一個村民和一個狼人，則狼人獲勝。

var 狼人們: Set<String> = ["妙麗","天狼星","榮恩","石內卜"]
var 村民們: Set<String> = ["跩哥","哈利","多比","佛地魔","金妮","鄧不利多","露娜","海格"]
var day = 1
var isNight = true

while !(狼人們.isEmpty || 村民們.isEmpty) {
    if (isNight) {
        let target = 村民們.randomElement()!
        村民們.remove(target)
        print("夜晚狼人行動，送走「\(target)」。")
    } else {
        let targets = 村民們.union(狼人們)
        
        let 一村民對一狼人 = targets.count == 2
        
        let target = 一村民對一狼人 ? 村民們.first! : targets.randomElement()!
        村民們.remove(target)
        狼人們.remove(target)
        
        print("白天大家投票決定，流放「\(target)」。")
        day += 1
    }
    isNight.toggle()
}
let winner = 狼人們.isEmpty ? "村民" : "狼人"
print("🗓 經過了 \(day) 天，\(winner)獲勝了。")
print("🎉 倖存者：\(狼人們.union(村民們).joined(separator: "、"))")
