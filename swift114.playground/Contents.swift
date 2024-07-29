// 流程控制：While Loop

// 募資 - 只知道目標「金額」

//let 目標金額 = 1_000_000
//var 現在金額 = 0
//
//while (現在金額 < 目標金額) {
//    let donation = (1...30000).randomElement()!
//    現在金額 += donation
//}
//print("募資成功！獲得了 \(現在金額) 元。")


// 猜年紀
//let age = 20
//var 下限 = 0
//var 上限 = 100
//var guess = -1
//
//repeat {
//    // 重複猜
//    if (guess > age) {
//        上限 = guess - 1
//    } else { 下限 = guess + 1}
//    
//    print("猜猜我幾歲～ 我是在\(下限) 到 \(上限) 歲～")
//    guess = Int.random(in: 下限...上限)
//} while (age != guess)
//print("答對了～就是 \(age) 歲")







// 【ChaoCode】 Swift 基礎篇 14：While Loop 實作作業
//
//
// 1. 請用 while loop 寫出整數「次方」的計算方法。

func 次方計算(_ base: Int, power: Int) -> Int {
    // base 表示底數；power 表是指數。例如：3 的 5 次方中，3 是底數、5 是指數。
    switch power {
        case 0:
            return 1
        case ..<0:
            return 0
        default:
            // 👇 請從這邊開始編輯，編輯範圍到「return result」那行之前，在這範圍中間你想加幾行都可以。
            var result = base // ⚠️ 最後請記得把你的運算結果存至這個變數中，你可以修改初始的「0」，但請勿更改變數名稱。
        var currentPower = 1
        while (currentPower != power) {
            result *= base
            currentPower += 1
        }
            return result // ⚠️ 請勿刪除這行。
    }
}

作業檢查(次方計算)


// 2. 請設計一個剪刀石頭布的遊戲，獲勝條件是三戰兩勝，平手不算。每一回合都需要印出猜拳狀況，最後印出最後的獲勝者、經過的局數和最終比數。
// 💡 提示：你可以從 Array 中取得 randomElement，也可以從正整數中取得 randomElement。
let moves = ["✊", "✌️", "✋"]
var playerAWin = 0
var playerBWin = 0
var rounds = 0
var winner = "Ａ"

repeat {
    rounds += 1
    let playerA = (0...2).randomElement()!
    let playerB = (0...2).randomElement()!
    
    switch playerA - playerB
    {
    case 0:
        let move = moves[playerA]
        print("兩方都出 \(move)，平手。")
    case -1, 2:
        winner = "A"
        playerAWin += 1
    default:
        winner = "B"
        playerBWin += 1
    }
    print("\(moves[playerA]) VS \(moves[playerB])，這局由玩家\(winner)獲勝。")
} while !(playerAWin == 2 || playerBWin == 2)

print("經過 \(rounds) 次猜拳，最後的贏家是「玩家\(winner)」，比數為 \(playerAWin)：\(playerBWin)。")
