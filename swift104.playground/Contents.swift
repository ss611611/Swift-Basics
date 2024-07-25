
// 文字類型 & 方法

//let text: String = "🇹🇼"
//
//print("文字長度：\(text.count)")
//print("Unicode: \(text.unicodeScalars.count)")
//print("第一個字：\(text.unicodeScalars.first!)")
//print("最後一個字：\(text.unicodeScalars.last!)")
//
//let t = "🇹"
//let w = "🇼"
//print("\(t) + \(w) = \(t + w )")

// unicode 啟動

//let text = "\u{1F44D}"
//let color = "\u{1F3FE}"
//
//print(text)
//print(color)

// 多行內容

//print("""
//A string is a series of characters, such as "Swift",\
//that forms a collection.
//Strings in Swift are Unicode correct and locale insensitive,\
//and are designed to be efficient.\
//The String type bridges with the Objective-C class\
//NSString and offers interoperability with C functions that works with strings.
//""")

// 特殊符號

//print("字串必須要用\"包覆換行 \\")

//print("""
//Swift 文字類型有：
//\t Character
//\t String
//""")



// 【ChaoCode】 Swift 基礎篇 4：文字類型實作作業
// 1. 根據以下已建立的符號，印出衝浪的男人和女人。（失敗時可以嘗試調整順序）

let 衝浪 = "🏄\u{200D}"
let 男人 = "\u{2642}\u{FE0F}"
let 女人 = "\u{2640}\u{FE0F}"


print("""
    🐬
🌊🌊🌊🌊🌊\(衝浪)🌊🌊🌊\(衝浪+女人)🌊\(衝浪+男人)🌊🌊🌊🌊🌊🏖🌴



""")




// 2. 請 debug 下面的 code，讓皮卡丘和愛心圖案正確印出。如果圖片對你來說太大了可以把第 55 行後刪掉。（包含第 55 行，記得最後的 print 不能刪掉。）

let emoji = "\u{1F495}"
let heartArt =  """
\t\t\t\t\t\t\(emoji)\(emoji)\(emoji)\t     \(emoji)\(emoji)\(emoji)
\t\t\t\t\t  \(emoji)      \(emoji)\(emoji)      \(emoji)
\t\t\t\t\t \(emoji)        \(emoji)        \(emoji)
\t\t\t\t\t \(emoji)                  \(emoji)
\t\t\t\t\t  \(emoji)                \(emoji)
\t\t\t\t\t\t\(emoji)            \(emoji)
\t\t\t\t\t\t  \(emoji)        \(emoji)
\t\t\t\t\t\t\t \(emoji)   \(emoji)
\t\t\t\t\t\t\t   \(emoji)
"""

let s = "" // 這個 s 變數只是加了讓你再複製貼上時圖片不會因為空白鍵被自動吃掉而跑位，可以無視這行，如果你想在你的皮卡丘前面多加一些空白也可以調整這個變數的內容。
let pikachu = """
"quu..__
\(s) $$$b  `---.__
\(s)  "$$b        `--.                          ___.---uuudP
\(s)   `$$b           `.__.------.__     __.---'      $$$$"              .
\(s)     "$b          -'            `-.-'            $$$"              .'|
\(s)       ".                                       d$"             _.'  |
\(s)         `.   /                              ..."             .'     |
\(s)           `./                           ..::-'            _.'       |
\(s)            /                         .:::-'            .-'         .'
\(s)           :                          ::''\\          _.'            |
\(s)          .' .-.             .-.           `.      .'               |
\(s)          : /'$$|           .@"$\\           `.   .'              _.-'
\(s)         .'|$u$$|          |$$,$$|           |  <            _.-'
\(s)         | `:$$:'          :$$$$$:           `.  `.       .-'
\(s)         :                  `"--'             |    `-.     \
\(s)        :##.       ==             .###.       `.      `.    `\
\(s)        |##:                      :###:        |        >     >
\(s)        |#'     `..'`..'          `###'        x:      /     /
\(s)         \\                                   xXX|     /    ./
\(s)          \\                                xXXX'|    /   ./
\(s)          /`-.                                  `.  /   /
\(s)         :    `-  ...........,                   | /  .'
\(s)         |         ``:::::::'       .            |<    `.
\(s)         |             ```          |           x| \\ `.:``.
\(s)         |                         .'    /'   xXX|  `:`M`M':.
\(s)         |    |                    ;    /:' xXXX'|  -'MMMMM:'
\(s)         `.  .'                   :    /:'       |-'MMMM.-'
\(s)          |  |                   .'   /'        .'MMM.-'
\(s)          `'`'                   :  ,'          |MMM<
\(s)            |                     `'            |tbap\\
\(s)             \\                                  :MM.-'
\(s)              \\                 |              .''
\(s)               \\.               `.            /
\(s)                /     .:::::::.. :           /
\(s)               |     .:::::::::::`.         /
\(s)               |   .:::------------\\       /
\(s)              /   .''               >::'  /
\(s)              `',:                 :    .'
\(s)                                   `:.:'
"""


print(heartArt + "\n" + pikachu)


// 圖片來源：https://www.asciiart.eu/video-games/pokemon by Tim Park
