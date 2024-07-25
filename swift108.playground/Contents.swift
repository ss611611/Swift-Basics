// Tuple

typealias Human = (name: String, height: Int, hirColor: String)
typealias Cat = (name: String, height: Int, hirColor: String)

let girl: Human = ("安妮", 155, "金")

let (_, _, hairColor) = girl
print(hairColor)

//print("小女孩的名字是\(girl.name)，身高約 \(girl.height) 公分，有著 \(girl.hirColor) 色的頭髮。")
//
//let man: Human = ("戴夫", 170, "咖")
//print("男生的名字是\(man.0)，身高約 \(man.1) 公分，有著 \(man.2) 色的頭髮。")
//
//print(Human(name: "Jane", height: 170, "黑"))
//print(Cat("蛋蛋", 60, "灰"))


// 【ChaoCode】 Swift 基礎篇 8：Tuple 實作作業


// 1. 下面已經建立兩位學生的名字和考試成績變數。請建立一個適合學生的 Tuple 資料類型並設定別名，接著把以下 Code 改成用你建立的 Tuple 資料類型的方式建立 學生A 和 學生B 各一個變數，然後檢查誰的考試成績比較好，並印出他的平均分數。

typealias student = (name: String, math: Double, english: Double, history: Double, mandarin: Double)

let studentA: student = ("小鴨", 93, 68, 77, 72)
let studentB: student = ("貝貝", 84, 89, 59, 72)
let studentATotal = studentA.math + studentA.english + studentA.history + studentA.mandarin
let studentBTotal = studentB.math + studentB.english + studentB.history + studentB.mandarin
let (winner, average) = studentATotal > studentBTotal ? (studentA.name, studentATotal / 4) : (studentB.name, studentBTotal / 4)

print("\(winner) 的平均分數較高，平均分數為 \(average) 分")


// 2. 請跟著步驟印出今天花了多少錢和今天的發票有沒有中獎。
// ⚠️ 和上次的作業一樣，請不用在意我提供的 Function 中語法是怎麼寫的，只要會呼叫和使用回傳值就可以了。

// 1️⃣ 請閱讀定義的 Tuple 別名和 Function 的參數和回傳值

typealias 發票 = (號碼: String, 消費金額: Int)

func 結帳(_ 商品價格: Int...) -> 發票
{
    let totalCost = 商品價格.reduce(0) { $0 + $1 }
    return 發票("RE" + Int.random(in: 100...999).description,
              totalCost)
}

func 檢查是否中獎(發票: 發票...) -> Bool
{
    let win = 發票.first { $0.號碼.hasSuffix("8") }
    return !(win == nil)
}

// 2️⃣ 以下是今天的三筆花費，請印出今天的總花費。
/* 
早餐：59 元套餐一份
午餐：牛丼 129 元、可樂餅 35 元、可爾必思 50 元
晚餐：義大利麵 215 元、拿鐵 90 元
*/
let 早餐發票 = 結帳(59)
let 午餐發票 = 結帳(129, 35, 50)
let 晚餐發票 = 結帳(215, 90)
let costTotal = 早餐發票.消費金額 + 午餐發票.消費金額 + 晚餐發票.消費金額

print("今天吃飯總共花了 \(costTotal) 元")

// 3️⃣ 請檢查今天的發票是否有中獎，並印出結果。
let isWinning = 檢查是否中獎(發票: 早餐發票, 午餐發票, 晚餐發票)

print(isWinning ? "發票中獎了！美好的一天" : "明天的發票會更好")
