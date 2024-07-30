// Dictionary

// 基本操作：建立、新增、存取、修改、刪除

//let dict: Dictionary<String, Int> = [:]
//let dict2: [String: Int] = [:]
//
//let dict3 = Dictionary<String, Int>()
//let dict4 = [String: Int]()
//
//let dict5 = ["ChaoCode": "棒"]

//// 建立
//var 水果庫存 = [String: Int]()
//
//// 新增、修改
//水果庫存["蘋果"] = 3
//水果庫存["蘋果"] = 6
//
//水果庫存.updateValue(10, forKey: "香蕉")
//水果庫存.updateValue(1, forKey: "香蕉")
//
//水果庫存["蘋果"]! += 6
//水果庫存["奇異果", default: 0] += 4
//
//// 刪除
//水果庫存["蘋果"] = nil
//水果庫存.removeValue(forKey: "香蕉")
//
//print(水果庫存)




//// Loop
//
//let 水果庫存 = ["蘋果": 3, "香蕉": 10, "奇異果": 4]
//
//
//for 名稱 in 水果庫存.keys {
//    print(名稱)
//}
//
//for 名稱 in 水果庫存.values {
//    print(名稱)
//}



// Collection 預留空間

//var array = [String]()
//array.reserveCapacity(<#T##minimumCapacity: Int##Int#>)

//var set = Set<Int>()
//set.reserveCapacity(<#T##minimumCapacity: Int##Int#>)
//set.count


//Set<Int>.init(minimumCapacity: 10)
//Dictionary<String, Int>.init(minimumCapacity: 10)
//print(Array<Int>.init(repeating: 0, count: 10))





// 【ChaoCode】 Swift 基礎篇 16：Dictionary 實作作業
//
// 1. 這一題是練習 Dictionary 基本操作，請跟著以下步驟完成。
//
// 1️⃣ 建立一個空的翻譯機 Dictionary 變數，Key 和 Value 都是 String。
var translator = [String: String]()
// 2️⃣ 下面 Array 裡的 Tuple 第一個位置是全為小寫的英文，第二個位置是對應的中文翻譯。請透過迴圈把這些資料都放進翻譯機裡，用英文當作 Key，中文當作 Value。
let 翻譯 = [("and", "和"), ("is", "是"), ("taiwan", "台灣"), ("love", "愛"), ("i", "我"), ("hotpot", "火鍋"), ("awesome", "牛")]
for (英文, 中文) in 翻譯 {
    translator[英文] = 中文
}

// 3️⃣ 透過翻譯機印出 Taiwan 的中文。
let taiwan = translator["Taiwan".lowercased()]!
print("Taiwan 的中文是「\(taiwan)」")

// 4️⃣ 把 awesome 的翻譯改成棒棒。
translator["awesome"] = "棒棒"

// 5️⃣ 透過翻譯機翻譯「I love hotpot」並印出中文。
// 💡 你會需要使用 String 中 「.split(separator:)」這個方法。
let sentence   = "Hotpot is awesome and I love hotpot"
let words = sentence.split(separator: " ")
var translated = ""
for word in words {
    translated += translator[word.lowercased()]!
}

print("\(sentence) 的中文是「\(translated)」")



// 2. 請透過奧斯卡入圍名單資料，計算每部電影總共入圍幾個獎項，最後印出入圍最多獎項的電影以及「沙丘」入圍幾個獎項。
// 💡 找出入圍最多獎項這點其實有一個 .sorted 方法可以使用，但因為我們還沒有學過 closure，所以請先用迴圈的方式找哦。

let 奧斯卡入圍名單 = 取得奧斯卡入圍名單()

var counter = [String: Int]()
// 開始一個 for 迴圈，遍歷 奧斯卡入圍名單 字典中的所有值，每個值都是一個電影名的數組。
for movieList in 奧斯卡入圍名單.values {
    // 在內部開始另一個 for 迴圈，遍歷當前 movieList 中的每個電影名。
    for movie in movieList {
        // 將當前電影名作為鍵，使用 counter 字典計數。default: 0 表示如果這個電影名還沒有在 counter 字典中出現，則將其初始值設為 0。然後每次出現這個電影名時，將其值加 1。
        counter[movie, default: 0] += 1
    }
}

// 宣告一個變數 入圍最多獎項，將 counter 字典中的第一個鍵值對賦值給它。這裡假設 counter 字典不為空。
var 入圍最多獎項 = counter.first!

//開始一個 for 迴圈，遍歷 counter 字典中的每個鍵值對（即每部電影及其入圍次數）。
for movie in counter {
    // 如果當前電影的入圍次數大於 入圍最多獎項 中保存的電影的入圍次數，則更新 入圍最多獎項 變數為當前電影及其入圍次數。
    if movie.value > 入圍最多獎項.value {
        入圍最多獎項 = movie
    }
}

print("📣 入圍最多獎項的電影是「\(入圍最多獎項.key)」")
print("🏜 沙丘入圍了 \(counter["沙丘"]!) 個獎項")
