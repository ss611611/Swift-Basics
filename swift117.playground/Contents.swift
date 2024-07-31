//public func printStringIofo(_ string: String) {
//    print("String: \(string) (字數：\(string.count)")
//    for index in string.indices {
//        let word = string[index]
//        print(word, "包含", word.unicodeScalars.count, "個 Unicode")
//    }
//}

// String.Index

//let sentence = "家人👵👶✌️"
//
//print(sentence.first!)
//print(sentence[sentence.startIndex])
//print(sentence.last!)
//print(sentence[sentence.index(before: sentence.endIndex)])





// 【ChaoCode】 Swift 基礎篇 17：Protocol & Generic 實作作業
//
// 💡 這兩題都是練習 String 的 Index 操作，所以你可能會想讀一下 String 文件裡頭「Manipulating Indices」這個分類下的屬性和方法。
//
// 1. 請印出位置所對應的 Character，你可以假設 string 不會是空的和 position 的數值大於 0 並且不大於 string.count。
// 例如：string 是 "Hello"，position 是 2 的話應印出 e。
//      string 是 "很好👍🏾"，position 是 3 的話應印出 👍🏾。

func 印出指定位置(_ string: String, position: Int) {
    // 👇 請從這邊開始編輯，最後記得要改 print 的內容。
    
    // 宣告一個變數 index，將其初始化為 string 的起始索引。startIndex 是字符串的第一個字符的位置。
    var index = string.startIndex
    // 宣告一個變數 count，初始值為 1。這個變數用來追踪當前字符的位置，因為位置計數從 1 開始。
    var count = 1
    // 開始一個 while 迴圈，條件是 index 不是字符串的結尾並且 count 小於 position。
    while index != string.endIndex && count < position {
        // 在每次迭代中，將 index 更新為字符串中當前索引的下一個索引，即移動到下一個字符。
        index = string.index(after: index)
        // 將 count 加 1，以反映當前字符的位置。
        count += 1
    }
    print(string[index])
}


// 2. 請檢查一個 input 是不是迴文字，你可以假設 string 一定不是空的且一定是小寫。
// 💡 迴文字指的是反過來看也一模一樣，例如「文言文」。
// 💡 CustomStringConvertible 是一個能把他的資料轉換成 String 的 Protocol，你可以看一下文件要怎麼拿到轉換後的 String。
// ⚠️ 請不要使用 .reversed() 方法。

func 迴文測試(_ input: CustomStringConvertible) -> Bool {
    // 👇 請從這邊開始編輯。
    var 是迴文 = true // 請勿修改這個變數名稱，但是你可以更改初始值，記得判斷完是否為迴文之後要把結果賦予這個變數。
    // 將 input 轉換為字符串，並將其賦值給常量 string。
    let string = input.description
    // 宣告一個變數 frontIndex，並將其初始化為字符串的起始索引。這個變數用來從字符串的前面開始遍歷。
    var frontIndex = string.startIndex
    // 宣告一個變數 backIndex，並將其初始化為字符串的最後一個字符的索引。這個變數用來從字符串的後面開始遍歷。
    var backIndex = string.index(before: string.endIndex)
    
    // 開始一個 while 迴圈，條件是 frontIndex 小於 backIndex 並且 是迴文 仍為 true。這個迴圈將逐字符地從字符串的兩端向中間移動。
    while (frontIndex < backIndex && 是迴文) {
        // 比較 frontIndex 和 backIndex 位置的字符是否相同。如果相同，是迴文 保持為 true，否則變為 false。
        是迴文 = string[frontIndex] == string[backIndex]
        // 將 frontIndex 移動到下一個字符。
        frontIndex = string.index(after: frontIndex)
        // 將 backIndex 移動到前一個字符。
        backIndex = string.index(before: backIndex)
    }
    
    
    
    // ⚠️ 請勿刪除和編輯這行以下的內容。
    return 是迴文
}


作業檢查(第一題: 印出指定位置, 第二題: 迴文測試)
