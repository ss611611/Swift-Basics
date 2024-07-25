
// Bool 布林值

let yes = true
let not = false

// 回傳 Bool 的方法
let int: Int = 16
//print(int.isMultiple(of: 8))

let price: Double = 1.1
price.isEqual(to: 1.1)
price.isLess(than: 1.2)
price.isLessThanOrEqualTo(1.1)

let string = "123"
string.isEmpty
/// 前綴字
string.hasPrefix("1234")
/// 後綴字
string.hasSuffix("13")

string.contains("12")

// 條件式運算子


//let payment = 500.0
//let shouldPayShippingFee = payment.isLess(than: 499)
//
//print(shouldPayShippingFee ? "自己付運費" : "免運")
//print(shouldPayShippingFee ? "含運總共\(payment + 60) 元" : "免運 \(payment) 元")
//print("應付金額為 \(shouldPayShippingFee ? payment + 60 : payment) 元")
//
//
//let isMale = true
//let canSpeakMandrin = false
//let greeting = canSpeakMandrin ? (isMale ? "你好" : "妳好") : "Hello"
//
//print(greeting)




// 【ChaoCode】 Swift 基礎篇 5：Bool 和條件運算子實作作業

// ⚠️ 注意這次的寫法比較不同，你只要編輯👇符號下面的內容即可，編輯範圍到 print 那行（包含 print），這之間你可以任意新增行數，如果還是不確定可以看影片結尾有解釋。
// 這個寫法是為了讓你能比較輕鬆測試不同結果，我把你的 code 包進 function 裡面。現在看不懂沒關係，function 是我們這系列之後會學到的內容。

// 1. 根據不同體重和身高印出不同訊息。

func 體重檢測(weight: Double, height: Double) {
    print("🌼 體重：\(weight) 公斤，身高 \(height * 100) 公分")
    // 👇 體重低於 50 時印出「不能捐血」；50 或 50 以上印出可以捐血。
    let isWeightBelowPar = weight.isLess(than: 50)
    print(isWeightBelowPar ? "不能捐血" : "可以捐血")
    // 👇 計算出 BMI: 體重 / (身高 * 身高)
    let bmi = (weight / (height * height))
    print("你的 BMI 是：\(bmi)")
    // 👇 BMI 小於等於 18.5 時印出「過瘦體型」；BMI 大於等於 30 時印出「過胖」；其餘印出「正常體型」。
    let isTooThin = bmi.isLessThanOrEqualTo(18.5)
    let isNormal = bmi.isLess(than: 30)
    print(isNormal ? (isTooThin ? "過瘦" : "正常") : "過胖", "體型", separator: "")
}

體重檢測(weight: 47.95385, height: 1.61)
體重檢測(weight: 75, height: 1.75)
體重檢測(weight: 130, height: 1.80)


// 2. 因應虎年，商店舉辦了名字裡有虎的客人可以獲得優惠的活動。請根據客人名字印出他能獲得多少優惠。


func 名字優惠活動(name: String) {
    // 👇 請印出正確的折扣資訊。名字裡有虎的人可以打 8 折；名字開頭是虎的人可以打 5 折；其餘沒有折扣。
    let hasNameTiger = name.contains("虎")
    let isTeginningTiger = name.hasPrefix("虎")
    let discount = hasNameTiger ? (isTeginningTiger ? "可以獲得半價優惠" : "可以獲得八折優惠") : "這次沒有獲得優惠"
    print("📢 名字是 \(name) 的客人，您\(discount)")
}


名字優惠活動(name: "小老虎")
名字優惠活動(name: "虎牙妹")
名字優惠活動(name: "小貓咪")
