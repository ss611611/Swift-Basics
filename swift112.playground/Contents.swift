// Array

//let 媽媽電話 = "0912-345-678"
//let 主管電話 = "0933-555-777"
//let 妹妹電話 = "0988-123-456"
//
//var 電話簿 = [String]()
//電話簿.append(媽媽電話)
//print(電話簿)
//電話簿.append(主管電話)
//print(電話簿)
//電話簿.insert(妹妹電話, at: 1)
//print(電話簿)
//
//電話簿[0] = "媽媽電話"
//print(電話簿[0])
//電話簿[1...2] = ["妹妹電話", "主管電話"]
//print(電話簿.joined(separator: " & "))
//
//電話簿.remove(at: 0)
//print(電話簿)
//電話簿.removeFirst()
//電話簿.removeFirst()
//電話簿.popLast()

//let number = [23, 177, 5, 9, 88]
//print(number.min()!)
//print(number.max()!)
//
//let sortNumber = number.sorted(by: >)
//print(number)
//print(sortNumber)





// 【ChaoCode】 Swift 基礎篇 12：Array 實作作業
//
// 這次的作業只有一題，請根據數字，按步驟建立一個歌單，每個步驟請都 ⚠️ 只使用一行 code 完成。

let 熱門歌曲 = ["如果可以", "好不容易", "想知道你在想什麼", "妹妹", "閣愛妳一擺"]
let 歌曲排行2021 = ["刻在我心底的名字", "愛情你比我想的閣較偉大", "在這座城市遺失了你", "飛鳥和蟬", "想見你想見你想見你"]

//1️⃣ 建立一個空的我的歌單 Array，Element 是 String。
var mySongList = [String]()

//2️⃣ 將熱門歌曲和歌曲排行2021依序放入我的歌單。
mySongList += 熱門歌曲 + 歌曲排行2021

//3️⃣ 把「忠孝東路走九遍」新增到第一首。
mySongList.insert("忠孝東路走九遍", at: 0)

//4️⃣ 把第五首歌換成「旅行的意義」。
mySongList[4] = "旅行的意義"

//5️⃣ 把第六和第七首換成「小幸運」和「小情歌」。
mySongList[5...6] = ["小幸運", "小情歌"]

//6️⃣ 刪除倒數第二首歌。
mySongList.remove(at: mySongList.count - 2)

//7️⃣ 印出歌曲數量。
print("我的歌單一共有 \(mySongList.count) 首歌")

//8️⃣ 依序印出所有歌曲名稱，每一首歌名用「、」分開。
print("🎤 我的歌單：\(mySongList.joined(separator: "、"))")

//9️⃣ 打亂歌單後再依序印出一次所有歌曲名稱，每一首歌名用「、」分開。
print("🎲 隨機排序：\(mySongList.shuffled().joined(separator: "、"))")
