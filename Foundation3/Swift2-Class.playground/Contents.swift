//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//类
class Person {
    //成员变量
    var firstName:String
    var lastName:String
    var career:String?
 
    //构造函数
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    //可以失败的构造函数
    init?(fullName:String){
        guard
            let spaceindex = fullName.rangeOfString(" ")?.startIndex
        else {
            return nil
        }
        self.firstName = fullName.substringToIndex(spaceindex)
        self.lastName = fullName.substringFromIndex(spaceindex.successor())
    }
    
    //方法
    func fullName() -> String {
        return firstName + " " + lastName
    }
}

let person1 = Person(firstName: "Edward", lastName: "Newgate")
person1.fullName()
person1.career

let person2 = Person(fullName: "Edward Newgate")
person2?.fullName()

//类是一个引用类型
let person3 = person1
person3.firstName = "Steve"
person3.lastName = "Jobs"
person3.career = "CEO"

//说明类是引用类型(Refrence type)
person1.firstName
person1.lastName
person1.career

//结构体若修改自身，需要关键字 mutating
struct Location {
    var x = 0
    mutating func go() { //自己改变自己
        self.x += 1
    }
}

var location = Location()
location.go()
location.go()
location.x

//枚举中也是如此
enum Switch {
    case On
    case Off
    
    mutating func click() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

//类的等价
//person1 == person3 //error
person1 === person2 //判断引用类型(比较的引用，是否指向同一块内存)
person1 === person3

person1 !== person2 //不等于，即不是同一块内存


