//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//枚举
//定义
enum Month {
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}

//简写
enum Season {
    case Spring, Summer, Autumn, Winter
}

var curMonth = Month.July
var curMonth2:Month = Month.July //显式定义
var curMonth3:Month = .July //显式可以省略

var sea = Season.Summer
var season:Season = .Summer

//原始值(Raw Value)
enum Fruit:Int {
    case Apple = 1
    case Orange = 2
    case Banana = 3
    case Watermelon = 4
}

//let fruit = 2

let fruit = Fruit.Apple
let fruit2 = Fruit(rawValue: 2) //返回值为可选型
Fruit.Watermelon.rawValue

//解包
if let fruit = Fruit(rawValue: 2) {
    
}

//可以只写第一个
enum Fruit2:Int {
    case Apple = 1, Orange, Banana, Watermelon
}

//也可以都不写，则默认从0开始
enum Fruit3:Int {
    case Apple, Orange, Banana, Watermelon
}

//整型值可以不连续
enum Coin:Int {
    case Penny = 1
    case Nickel = 5
    case Dime = 10
    case Quarter = 25
}

//枚举类型的值可以是 String 类型，例如：
enum ProgrammingLanguage:String {
    case Swift = "Swift"
    case Java = "Java"
    case OC = "OC"
}

//String 类型不写的话，默认是定义的本身
enum ProgrammingLanguage2:String {
    case Swift, Java, ObjectiveC = "Objective-C"
}

//关联值(Associate Value, 可以关联不同类型，而且可修改。与 Raw Value 互斥)
enum ATMStatus {
    case Success(Int)
    case Error(String)
}

enum ATMStatus2 {
    case Success(Int)
    case Error(String)
    case Waiting //无关联值
}

var balance = 1000
func withdraw(amount:Int) -> ATMStatus {
    if balance >= amount {
        balance -= amount
//        return ATMStatus.Success(balance)
        return .Success(balance) //可以这样简写
    }
    else {
        return .Error("Not enough money")
    }
}

let result = withdraw(100)
switch result {
case let .Success(newBalance):
    print("￥\(newBalance) left in your count")
case let .Error(errorMessage):
    print("Error: \(errorMessage)")
}

//若只关心是否成功，不关心其他信息，可以这么写
switch result {
case .Success:
    print("success")
case .Error:
    print("error")
}

//还可以关联多个值(实际上是关联了一个元组)
enum Shape {
    case Square(side:Double)
    case Rectangle(width:Double, height:Double)
    case Circle(centerX:Double, centerY:Double, radius:Double)
    case Point
}

func area(shape:Shape) -> Double {
    switch shape {
    case let .Square(side):
        return side * side
    case let .Rectangle(width, height):
        return width * height
    case let .Circle( _, _, radius):
        return M_PI * radius * radius
    case .Point:
        return 0
    }
}

let square = Shape.Square(side: 3)
let rectangle = Shape.Rectangle(width: 5, height: 3)
let circle = Shape.Circle(centerX: 6, centerY: 7, radius: 3)
let point = Shape.Point

area(square)
area(rectangle)
area(circle)
area(point)

//显式声明可选型
var website:Optional<String> = Optional.Some("123.com") //Optional 是枚举类型
website = .None

//枚举递归 (indirect 关键字)
indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

//或者这样
enum ArithmeticExpression2 {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

//(5 + 4) * 2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let two = ArithmeticExpression.Number(2)
let product = ArithmeticExpression.Multiplication(sum, two)

func evaluate(expression:ArithmeticExpression) -> Int {
    switch expression {
    case let .Number(value):
        return value
    case let .Addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .Multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

evaluate(product)
evaluate(sum)

