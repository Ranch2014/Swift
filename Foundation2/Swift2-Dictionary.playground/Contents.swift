//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//字典
//声明
var dict:[String : String] = ["swift":"雨燕；迅速的", "python":"大蟒"]
var dict2:Dictionary<String, String> = ["swift":"雨燕；迅速的", "python":"大蟒"]

var dic = ["hi":1, "hello":2]

//声明空的字典
var emptyDict:[String:Int] = [:]
var emptyDict2:Dictionary<String, Int> = [:]
var emptyDict3 = [String:String]()
var emptyDict4 = Dictionary<String, String>()

dict["swift"] //返回可选型
print(dict["swift"])

if let value = dict["swift"] {
    print(value)
}

//其他方法
dict.count //多少键值对
dict.isEmpty
Array(dict.keys) //获取所有的 key
Array(dict.values) //获取所有的 value

//遍历
for key in dict.keys {
    print(key) //注意：字典是无序的数据集合s
}

for (key, value) in dict {
    print("\(key) : \(value)")
}

//字典的比较
let dict3 = [1:"a", 2:"b", 3:"c"]
let dict4 = [3:"c", 1:"a", 2:"b"]
dict3 == dict4 //true, 比较的是值，和顺序无关，但键不能重复


//增删改
var dict5 = ["name":"Luffy", "occupation":"pirate"]
dict5["name"] = "Zoro" //注意：若key存在，则是修改；若不存在，则是增加
dict5
dict5.updateValue("swordsman", forKey: "occupation") //返回的是修改前的值（可选型，可用于修改密码的提示）
dict5

//dict5["name"] = nil //删除某个键值对
dict5
dict5.removeValueForKey("name") //返回删除掉的值(可选型，类似 updateValue)
dict5

if let name = dict5.removeValueForKey("name") {
    print(name)
}

dict5.removeAll() //清空





