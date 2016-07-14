//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//定义常量和变量
var maxNum = 100
maxNum = 200

var x = 1, y = "hi" //定义变量

let url:String = "www.abc.com" //显示定义

var a, b, c : Double //声明a, b, c均为Double类型

// Type inference
//x = "12" //error

print(x)

print(y)

//数据类型

var imInt:Int = 20
Int.max //Int 类型的最大值

Int.min

//UInt
var imUInt:UInt = 30
UInt.max
UInt.min

//各种进制
let decimalInt:Int = 17
let binaryInt:Int = 0b10001
let octalInt:Int = 0o21
let hexInt:Int = 0x11

//下划线 _ 分隔大数
let bigNum = 1_000_000

//浮点型
let floatNum:Float = 3.1415926
let doubleNum:Double = 3.1415926

//科学计数法表示
var d = 1.2e5
var e = 1.2e-5

let x1:UInt8 = 12
let x2:UInt16 = 21

let m = UInt16(x1) + x2 //二者必须强制转换为相同类型才能进行运算
let n = x1 + UInt8(x2) //注意强转的写法

var red:CGFloat = 0.7
var green:CGFloat = 0.6
var blue:CGFloat = 0.7
UIColor(red: red, green: 0.3, blue: blue, alpha: 1.0)

//布尔类型
let imTrue:Bool = false;
if imTrue { //int不能解读为布尔类型
    print("I'm true")
}
else {
    print("I'm false")
}

if 1+1==2 { //OK
    print("1 + 1 = 2")
}

//Tuple 元组
var point = (1, 3)
var httpResponse = (404, "Not Found")

var point2:(Int, Int, Int) = (1, 2, 4) //显式定义
var httpResponse2:(Int, String) = (200, "OK")

var point3 = (x:1, y:2, z:4)
var point4:(x:Int, y:Int, z:Int) = (1, 2, 4)

//解包
let (xx, yy) = point

httpResponse.0
httpResponse.1

point3.x
point4.y

let loginInfo = (true, "user")
let (isSuccess, _) = loginInfo //_ 表示对该变量不感兴趣
if isSuccess {
    print("success")
}

var 名字 = "Ace"
print("名字是: " + 名字)

var 😀 = "smile"
print(😀)

print(名字, 😀)
print(名字, 😀, separator:" - ") //分隔符(默认是空格)
print(名字, 😀, separator:"--", terminator:", end") //结束符(默认是回车 \n)
print("sa")

let i=2, j=3, k=5
print("\(i) * \(j) * \(k) = \(i*j*k)") // \()

//取余
let u = -2.5
let v = 1.2
u % v

let money = 100
let price = 80
if money >= price {
    print("Buy it!")
}

//逻辑运算
let capacity = 30;
let volume = 50
if capacity >= volume && money >= price {
    print("buy")
}

if capacity < volume || money < price {
    print("can't  buy it")
}

if !(capacity >= volume && money >= price) {
    print("buy")
}

//三目运算符
var battery = 2;
var batteryColor:UIColor

var batteryColor2 = battery > 20 ? UIColor.greenColor() : UIColor.redColor() //三目运算符表示

//等效结果
if battery > 20 {
    batteryColor = UIColor.greenColor()
}
else {
    batteryColor = UIColor.redColor()
}

//范围运算符
for index in 1...5 { //... 前后都是闭区间
    index
//    index = 3 //error, 这里的index是常量
}

for index in 1..<5 { //..< 前闭后开区间
    index
}

//控制流
var result = 1
var base = 2
var power = 10
for _ in 1...10 { //忽略第几次
    result *= base
}
result

for i in -99...99 {
    i*i
}

//等效
for var i = -99; i <= 99; i++ {
    i*i
}

for var i = -6.28; i <= 6.28; i += 0.1 {
    sin(i)
}

var index = -99
var step = 1
for ; index <= 99; index += step { //这是神马？？
    index * index
    step *= 2
}


