// 條件式流程控制：if / else if / else

//var food = "🍞"
//let 吃全素 = false
//let 吃蛋奶素 = false
//
//if (吃全素) {
//    food += "🍅🍄"
//} else if (吃蛋奶素) {
//    food += "🥚🧀"
//} else {
//    food += "🥚🥓"
//}
//
//print("您的餐點:\(food)")

//let birthday = (year: 1994, month: 9, day: 5)
//let today = (year: 2022, month: 4, day: 1)
//
//let age = today.year - birthday.year
//let 生日在這個月以前 = today.month > birthday.month
//let 已過生日 = 生日在這個月以前 || (today.month == birthday.month && today.day >= birthday.day)
//
//if (age > 18 || (age == 18 && 已過生日)) {
//    print("成年")
//} else { print("未成年") }


//let 我喜歡他 = false
//let 他喜歡我 = true
//
//if (我喜歡他) {
//    if (他喜歡我) {
//        print("兩情相悅～～")
//    } else {
//        print("單相思")
//    }
//} else if (他喜歡我) {
//    print("單相思")
//} else {
//    print("不來電")
//}
//
//if (我喜歡他 || 他喜歡我) {
//    if (我喜歡他 == 他喜歡我) {
//        print("兩情相悅～～")
//    } else {
//        print("單相思")
//    }
//} else {
//    print("不來電")
//}
//
//let 感覺不一樣 = 我喜歡他 != 他喜歡我
//
//if (感覺不一樣) {
//    print("單相思")
//} else if (我喜歡他) {
//    print("兩情相悅～～")
//} else {
//    print("不來電")
//}


// 四捨五入字串

//let number = 123124.74023402394
//print(number)
//
//import Foundation
//
//let formatter = NumberFormatter()
//formatter.maximumFractionDigits = 2
//formatter.numberStyle = .spellOut
//formatter.locale = Locale.init(identifier: "zh-tw")
//print(formatter.string(for: number)!)




import Foundation

// 【ChaoCode】 Swift 基礎篇 9：條件式流程控制——If 實作作業

// 1. 請根據下述的學校入學條件判斷入學申請者能否入學，並印出對印的文字。
// 「這間學校的入學門檻是平均成績須達 80 分，學費為 128,000 元，平均成績達 92 分以上可以以獎學生身份享全額補助入學。」

func 入學申請(名字: String, 平均成績: Int, 存款: Int)
{
    let threshold = (平均成績 >= 80 && 平均成績 < 92 && 存款 >= 128000)
    if (threshold) {
        print("✅ \(名字) 可以入學。")
    } else if (平均成績 >= 92) {
        print("🎉 \(名字) 以獎學生身份入學。")
    } else if (平均成績 >= 80 && 存款 < 128000) {
        print("😢 \(名字) 成績達入學門檻，但無法支付學費，不能入學。")
    } else {
        print("❌ \(名字) 成績未達入學門檻，不能入學。")
    }
}

入學申請(名字: "保羅", 平均成績: 80, 存款: 128000)
入學申請(名字: "傑克", 平均成績: 92, 存款: 18000)
入學申請(名字: "蘿拉", 平均成績: 95, 存款: 356700)
入學申請(名字: "馬丁", 平均成績: 70, 存款: 152340)
入學申請(名字: "米娜", 平均成績: 84, 存款: 238920)
入學申請(名字: "海倫", 平均成績: 90, 存款: 127000)


// 2. 請根據 Google Doc 中提供的體脂率計算法和體型對照表印出正確的體脂率和體型資訊，如果對象低於 18 歲則只印出「多吃多動，健康快樂長大就好」。

func 體脂率計算(名字: String, 是男生: Bool, 年齡: Int, 身高: Double, 體重: Double)
{
    //👇 請根據不同情況印出以下五種結果，記得要計算體脂率並把它印出來的值四捨五入到小數點第一位。
    
    
    if (年齡 < 18) {
        print("\(名字)，多吃多動，健康快樂長大就好。")
    } else {
        let bmi = 體重 / ((身高 / 100) * (身高 / 100))
        let bodyFat = (1.2 * bmi) + 0.23 * Double(年齡) - 5.4 - 10.8 * (是男生 ? 1 : 0)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        let bodyFatString = "\(名字)的體脂率是 \(formatter.string(for: bodyFat)!) %"
        let genderBias = 是男生 ? 0 : (21 - 8)
        
        // 💡 以男生 18~39 歲為基準，計算不同性別和年紀的偏差值。
        let isYoungAdult = 年齡 < 40
        var ageBias = 0
        if (!isYoungAdult) {
            let isElder = 年齡 > 59
            if (是男生) { ageBias += isElder ? 5 : 3 }
            else { ageBias += isElder ? 3 : 2 }
        }
        
        // 💡 把偏差值加起來，計算出正常範圍和肥胖下限
        let bias = Double(genderBias + ageBias)
        let normalLowerBound  = 8 + bias
        let normalUpperBound  = 20 + bias
        let obesityLowerBound = 25 + bias
        let idealRangeString  = "理想值應為 \(normalLowerBound) ％ ～ \(normalUpperBound) %"
        
        if (bodyFat < normalLowerBound) {
            print("\(bodyFatString)，低於正常標準，\(idealRangeString)。")
        } else if (bodyFat < normalUpperBound) {
            print("\(bodyFatString)，位於正常標準，繼續保持！")
        } else if (bodyFat < obesityLowerBound) {
            print("\(bodyFatString)，高於正常標準，\(idealRangeString)。")
        } else {
            print("\(bodyFatString)，屬於過胖體型，\(idealRangeString)。")
        }
    }
}

體脂率計算(名字: "亞倫", 是男生: true, 年齡: 17, 身高: 149, 體重: 40)
體脂率計算(名字: "克里斯", 是男生: true, 年齡: 40, 身高: 150, 體重: 60)
體脂率計算(名字: "丹尼", 是男生: true, 年齡: 20, 身高: 181, 體重: 53)
體脂率計算(名字: "比爾", 是男生: true, 年齡: 26, 身高: 165, 體重: 53)
體脂率計算(名字: "吉米", 是男生: true, 年齡: 60, 身高: 173, 體重: 120)
體脂率計算(名字: "艾瑪", 是男生: false, 年齡: 17, 身高: 149, 體重: 40)
體脂率計算(名字: "凱西", 是男生: false, 年齡: 40, 身高: 150, 體重: 60)
體脂率計算(名字: "黛比", 是男生: false, 年齡: 20, 身高: 180, 體重: 53)
體脂率計算(名字: "瑪麗", 是男生: false, 年齡: 26, 身高: 165, 體重: 53)
體脂率計算(名字: "米蘭達", 是男生: false, 年齡: 60, 身高: 173, 體重: 120)
