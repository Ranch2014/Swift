//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var str0:String = "Hello, playground" //显式声明

// 字符串
var str2 = String("Hello, Swift")

str2.characters.count
var startIndex2 = str2.startIndex
var endIndex2 = str2.endIndex
str2[str2.endIndex.predecessor()]

var range2 = startIndex2..<endIndex2
str2.removeRange(range2)
str2

//声明空字符串
var emptyString = ""
var emptyStr = String()
var emptyStr2 = String("")

emptyStr.isEmpty //判空

var mark = "!!!"
str2 + mark
str2
str2 += mark //改变 str2 的值

var s = "\""
s

mark.endIndex


//遍历字符串中的每一个字符
for c in str.characters {
    print(c)
}

let mark2:Character = "~" //声明Character类型的变量(不写则默认为String类型)

str + String(mark2) //字符串和字符连接的两种方式(不改变str)
str.append(mark2) //会改变str变量

//Character可以表示汉字或表情
let enLetter:Character = "a"
let cnLetter:Character = "你"
let dog:Character = "🐶"
let cool:Character = "\u{1F60E}"

//解析字符串长度时，一个汉字或一个表情都算一个长度

var cafe = "café"
var cafe2 = "cafe\u{0301}"
cafe == cafe2 //true
//[0, 4)
cafe.characters.count


//String.Index
var startIndex = cafe.startIndex //Index类型
cafe.endIndex
//[startIndex, endIndex)

cafe[startIndex]
cafe[startIndex.successor()] //获取后一个字符索引
cafe[startIndex.advancedBy(2)] //距离，类似于偏移量。获取新的索引的位置
cafe[startIndex.advancedBy(4).predecessor()] //前一个

var endIndex = cafe.endIndex
endIndex.predecessor() //前一个索引，3
cafe[endIndex.predecessor()] //最后一个字符

//字符串区间
var range = startIndex..<endIndex //Range<Index> 类型
cafe[range]

cafe.appendContentsOf("---") //添加字符串
cafe.insert("?", atIndex: endIndex) //添加字符到指定位置
var ne = startIndex.advancedBy(3)

endIndex
cafe.removeAtIndex(cafe.endIndex.predecessor())
cafe.removeRange(cafe.endIndex.advancedBy(-3)..<cafe.endIndex) //移除某个区间内的字符串
cafe

//字符串常用方法
str.characters.count //字符串的长度
cafe.uppercaseString //转大写
cafe.lowercaseString
cafe.capitalizedString //首字母大写
cafe.containsString("af") //是否包含某字符串
cafe.containsString(cafe)
cafe.hasPrefix("ca") //判断前缀
cafe.hasSuffix("end") //判断后缀

let s0 = "one third is \(1.0/3.0)"
var ss = String(format: "one third is %.2f", 1.0/3.0)

let s3 = " -- hello --- " as NSString //转为NSString类型
s3.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " -")) //去除空格和下划线



