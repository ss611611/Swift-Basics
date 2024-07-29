// 流程控制：For Loop

//let numbers = [23, 177, 5, 9, 88, 0]
//
//var minNumber = numbers.first!
//var maxNumber = numbers.first!
//for number in numbers {
//    minNumber = number < minNumber ? number : minNumber
//}
//print(minNumber)

//for number in numbers[1...] {
//    minNumber = min(number, minNumber)
//    maxNumber = max(number, maxNumber)
//}
//print(minNumber, maxNumber)

//var numbers = [23, 177, 5, 9, 88, 0]
//
////numbers.replaceSubrange(<#T##subrange: Range<Int>##Range<Int>#>, with: <#T##Collection#>)
//let range = 3...4
//let replacement = 100
//for index in range {
//    numbers[index] = replacement
//}
//print(numbers)

//var numbers = [23, 177, 5, 9, 88, 0]
//
////numbers.firstIndex(of: <#T##Int#>)
//
//let element = 5
//
//for index in numbers.indices {
//    let number = numbers[index]
//    if number == element {
//        print("這個值得位置在 \(index) ")
//        break
//    }
//}


//var numbers = [23, 177, 5, 9, 88, 0]
//
//for number in numbers {
//    if (number > 50) {
//        print(number)
//    }
//}
//
//for number in numbers {
//    if !(number > 50) {  continue  }
//    print(number)
//}


//typealias Food = (name: String, price: Int, 飽食度: Int)
//
//let 食物: [Food] = [
//    ("生魚片", 200, 2),
//    ("滷肉飯", 40, 5),
//    ("沙拉", 150, 2),
//    ("雞腿便當", 140, 7),
//    ("御飯糰", 30, 4),
//    ("巧克力冰淇淋", 70, 3),
//    ("咖啡", 80, 1),
//    ("珍奶", 60, 3),
//    ("牛肉麵", 180, 8),
//    ("咖喱蛋包飯", 150, 7),
//    ("雞排", 80, 6)
//]
//
//var 飽食度 = 5
//var 錢 = 500
//
//for food in 食物 {
//    飽食度 -= 5
//    if (飽食度 < 0) {
//        print("餓死了")
//        break
//    }
//    
//    if 錢 < food.price {
//        print("我只有 \(錢) 元，吃不起 \(food.price) 元的 \(food.name)，餓到下一餐")
//    }
//    飽食度 += food.飽食度
//    錢 -= food.price
//    print("吃了 \(food.name)")
//}




// 【ChaoCode】 Swift 基礎篇 13：For Loop 實作作業
//
//
// 1. 學校宿舍新建房間，可再容納 20 人。校方想把這些房間預留給曾經申請過但沒有申請到的學生。請透過前一次的宿舍申請名單，找到其中出席率最高且尚未有宿舍的 20 位學生。以利學校寄送優先申請通知。

let students = getStudentList() // 這是一個已根據出席率由高至低排序的學生清單。
var studentsWithNoDorm: [Student] = [] // 請勿更改此變數名稱。

// 👇 請在下方寫一個 For Loop 完成這題，把「符合條件的」學生放到「studentsWithNoDorm」Array 中，並且使用到 continue 和 break。
for student in students {
    if student.已有宿舍 { continue }
    studentsWithNoDorm.append(student)
    if studentsWithNoDorm.count == 20 { break }
}




// 2. 請從一份全球前 50 名最高票房電影清單中，根據年份印出當年的前三最高票房電影。
func 前三名票房(of year: Int)
{
    let top50Movies: [Movie] = getTop50Movies() // 這是一個已根據票房由高至低排序的全球前 50 名票房電影清單。
    
    var moviesOfTheYear: [Movie] = []
    
    for movie in top50Movies {
        if movie.year != year { continue }
        moviesOfTheYear.append(movie)
        if moviesOfTheYear.count == 3 { break }
    }
    
    if moviesOfTheYear.isEmpty {
        print("\(year) 沒有高票房的電影 🥲")
    } else {
        print("🍿 \(year) 票房：")
        for index in 0..<moviesOfTheYear.count {
            print("\t第 \(index + 1) 名是「\(moviesOfTheYear[index].name)」")
        }
    }
}



作業測試(students: studentsWithNoDorm, boxOfficeRank: 前三名票房) // 請勿移除這行

// 3. 學生會舉辦年度方向投票活動，一共有六個主題，請使用 Loop 語法完成計票並印出結果，超過 50% 支持即表示通過。（投票率不需印出小數點位數）

let 所有投票主題 = [
    "宿舍門禁由 22 點改為 23 點",
    "每週二設為節水日，停水一天",
    "鼓勵運動，提高體能的畢業門檻",
    "學校商店從 7-11 改成全家",
    "開放早上第一堂課吃早餐",
    "開放在雨天穿拖鞋上課",
]

//👇 請直接使用這個「所有投票」的變數，裡面是 1000 筆投票資料，每一筆投票都是一個 Bool 的 Array，裡頭有 6 個布林值對應上面的投票主題。例如 [true, false, true, true, false, true]，第一個 true 對應的就是支持「宿舍門禁由 22 點改為 23 點」、第二個 false 對應的就是不支持「每週二設為節水日，停水一天」。
所有投票


for topic in 所有投票主題.indices {
    var voteCount = 0
    for votes in 所有投票 {
        let votedYes = votes[topic]
        if (votedYes) {voteCount += 1 }
    }
    
    let rate = Int(Double(voteCount) / Double(所有投票.count) * 100)
    print("「\(所有投票主題[topic])」的支持率是 \(rate)%，\(rate > 50 ? "通過" : "不通過")。")
}

// 💡 以下是是示範如何取得第一題題目＆「前十張」票中對第一題的的選擇。如果你覺得這題不太好理解，也許看看這段會有幫助。（你可以從這段 code 開始調整或是完全刪除）
print("投票主題：", 所有投票主題[0])
for index in 0..<10 {
    let 投票單 = 所有投票[index]
    let 支持  = 投票單[0]
    print("第 \(index) 張票：\(支持 ? "支持" : "反對")")
}

