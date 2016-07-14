//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//while 循环
var i = 0
while i < 3 {
    print(i)
    i++
}

//repeat..while循环，相当于do..while
var j = 0
repeat {
    j++
    print(j)
} while j < 3


while true {
    let a = arc4random_uniform(6) + 1  //arc4random_uniform(n) [0, n) 随机数
    let b = arc4random_uniform(6) + 1
    if a == b {
        print("draw")
        continue
    }
    let winner = a > b ? "A" : "B"
    print("\(winner) win")
    break
}


//switch语句 (PS: 无需 break, 执行一个case后自动跳出)
var rating = "a"
switch rating {
case "A", "a": //判断多种不同的值
    print("great")
case "B":
    print("so-so")
case "C":
    print("bad")
default : //switch必须穷举所有情况
    print("error")
}

// case 可以是布尔类型或浮点型等
let b = true
switch b {
case true:
    print("true")
default:
//    print("false")
//    break
    () //若无任何操作，可用 break 或 () 来结束
}

//switch高级用法
let score = 89
switch score {
case 0:
    print("you got an egg")
case 1..<60: //判断区间
    print("you failed")
case 60..<80:
    print("good")
case 80..<90:
    print("nice")
case 90..<100:
    print("great")
case 100:
    print("perfect")
default:
    print("error")
}

// 和元组配合使用
let point = (1, 1)
switch point {
case (0, 0):
    print("0, 0")
case (_, 0): //忽略一些内容
    print("x-axis")
case (0, _):
    print("y-axis")
case (-2...2, -2...2): //可以使范围
    print("near the origin")
default:
    print("youa are crazy")
}

let point2 = (0, 0)
switch point2 {
case (0, 0):
    print("origin")
    fallthrough //穿透case，但下层case中不能声明变量
case (_, 0):
    print("x-axis")
//    print("value of x is \(x)")
case (0, let y):
    print("y-axis")
    print("value of y is \(y)")
case (let x, let y):
    print("the point is (\(x), \(y))")
}

// 跳出指定的循环，给循环命名
findAnswer:
for m in 1...300 { //
    for n in 1...300 {
        if m*m*m*m - n*n == 15*m*n {
            print(m, n)
            break findAnswer //结束循环过程
        }
    }
}

//配合case...where
let point3 = (2, 2)
switch point3 {
case (let x, let y) where x == y:
    print("It's on the line x=y")
case let (x, y) where x == -y:
    print("It's on the line x=-y")
case let (x, y):
    print("the point is (\(x), \(y))")
}

// 也可用在if语句中
let age = 19
switch age {
case 10...19:
    print("you're a teenager")
default:
    print("you are not")
}

if case 10...19 = age {
    print("you're a teenager")
}

if case 10...19 = age where age >= 18 {
    print("you're a teenager")
}

for i in 1...20 {
    if i % 3 == 0 {
        print(i)
    }
}

for case let i in 1...20 where i % 3 == 0 {
    print(i)
}


//guard 关键字
func buy(money:Int, price:Int, capacity:Int, volume:Int) {
    if money >= price {
        if capacity >= volume {
            print("I can buy it!")
            print("￥\(money-price) left")
            print("\(capacity-volume) cubic meters left")
        }
        else {
            print("No enough capacity")
        }
    }
    else {
        print("No enough money")
    }
}

func buy2(money:Int, price:Int, capacity:Int, volume:Int) {
    guard money >= price else {
        print("No enough money")
        return
    }
    
    guard capacity >= volume else {
        print("No enough capacity")
        return
    }
    
    print("I can buy it!")
    print("￥\(money-price) left")
    print("\(capacity-volume) cubic meters left")
}

buy(20, price: 12, capacity: 80, volume: 60)

buy2(20, price: 12, capacity: 80, volume: 60)



