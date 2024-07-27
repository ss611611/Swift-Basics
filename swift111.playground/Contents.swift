// 條件式流程控制：Switch
/*
let age = 7

if (age <= 2) {
    print("嬰兒")
} else if (age <= 5) {
    print("幼兒")
} else if (age <= 12) {
    print("兒童")
} else if (age <= 18) {
    print("青少年")
} else if (age < 60) {
    print("成年人")
} else {
    print("老年人")
}
*/


//let age = 7
//
//switch age {
//case ...2:
//    print("嬰兒")
//case ...5:
//    print("幼兒")
//case ...12:
//    print("兒童")
//case ...18:
//    print("青少年")
//case ..<60:
//    print("成年人")
//default:
//    print("老年人")
//}
//
//let 相親對象 = ("陳奕", 180)
//
//switch (相親對象) {
//    case (let 名字, 180...) where 名字.first != "陳":
//        print("可以安排和 \(名字) 見面")
//    default:
//        print("可以當朋友")
//        break
//}



// 【ChaoCode】 Swift 基礎篇 11：Switch 實作作業
//
// 1. 請使用 Switch 的條件控制語法，根據月份和地理位置印出季節資訊。
// 北半球： 1~3 月是春天；4~6 月是夏天；7~9 月是秋天；10~12 月是冬天。
// 南半球： 1~3 月是秋天；4~6 月是冬天；7~9 月是春天；10~12 月是夏天。

func 季節判斷(地點: String, 是北半球: Bool, 月份: Int)
{
    //👇 請在以下 print 之前的範圍編輯，不限行數。記得最後要把 print 那行的季節答案改好。
    print("\(地點)在 \(月份) 月時會是", terminator: "")
    let 月份 = 是北半球 ? 月份 : (月份 + 6) % 12
    switch 月份 {
    case 1...3:
        print("春天")
    case 4...6:
        print("夏天")
    case 7...9:
        print("秋天")
    case 10...12, 0:
        print("冬天")
    default:
        break
    }
    
}





// 2. 請使用 Switch 的條件控制語法，根據以下條件幫你朋友篩選約會對象。
// 理想對象：30 歲以內（不含），是男生的話身高至少 180，女生的話身高至少 165。
// 可以考慮：40 歲以內（不含），是男生的話身高至少 177，女生的話身高至少 162，距離在 10.0 公里以內(含）。
// 值得關注：20 歲以內（不含），距離在 15.0 公里以內(含）。

// Person 裡面的資料依序代表是：名字、是否是男生、年齡、身高、距離、自我介紹。
func 過濾配對(_ person: Person)
{
    // 👇 請只在以下這個 switch 的範圍內編輯，並且不使用 if 語句。
    switch person {
    case (let name, let isMale, ..<30, let height, _, let self) where height >= 165 && (!isMale || height >= 180):
        print("💘 理想對象：\(name)「\(self)」")
        
    case (let name, let isMale, ..<40, let height, ...10, let self) where height >= 162 && (!isMale || height >= 177):
        print("🤗 可以考慮：\(name)「\(self)」")
        
    case (let name, _, ..<20, _, ...15, let self):
        print("👀 值得關注：\(name)「\(self)」")
    
    default:
            break
    }
}

// 請記得下載 checkHelper 才能執行下面這行作業檢查喔 ☺️
作業檢查(weather: 季節判斷, match: 過濾配對)

