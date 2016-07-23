//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//函数
//关键字 函数名(参数) -> 返回值类型
func sayHelloTo(name:String?) -> String {
    return "Hello, " + (name ?? "Guest")
}

var nickName:String? = nil
sayHelloTo(nickName)

//无参数，无返回值的函数
func printHello() {
    print("Hello")
}
printHello()

func printHello2() -> () {
    print("Hello")
}
printHello2()

func printHello3() -> Void {
    print("Hello")
}

//返回值为元组类型
func findMaxAndMin(numbers:[Int]) -> (max:Int, min:Int)? {
//    if numbers.isEmpty {
//        return nil
//    }
    
    //与前者等效
    guard numbers.count > 0 else {
        return nil
    }
    
    var maxValue:Int = numbers[0]
    var minValue:Int = numbers[0]
    for num in numbers {
        minValue = num < minValue ? num : minValue;
        maxValue = num > maxValue ? num : maxValue;
    }
    return (maxValue, minValue)
}

var arr:[Int]? = [1, 2, 5, 9, 3, 0]
arr = arr ?? [] //保证 arr 不为 nil
if let result = findMaxAndMin(arr!) {
    print("max is \(result.max)")
    print("min is \(result.min)")
}

//多个参数的函数
func sayName(firstName:String, lastName:String) -> String {
    return "Hello! " + firstName + " - " + lastName
}

sayName("Edward", lastName: "Newgate") //注意：调用多参函数时，第二个参数以后的参数名要写

//lastNameIs 是外部参数名 (第一个参数也可设置外部参数名)
func sayName2(firstName:String, lastNameIs lastName:String) -> String {
    return "Hello! " + firstName + " - " + lastName
}

//lastNameIs 是外部参数名
sayName2("Edward", lastNameIs: "Newgate")

//忽略第二个参数的名字(调用的时候无需写参数名字)
func multiply(num1:Int, _ num2:Int) -> Int {
    return num1 * num2
}
multiply(3, 7)

//设置默认参数值(也可设置多个参数有默认值，若如此，则函数参数的顺序可以改变)
func multiply2(num1:Int, num2:Int = 10) -> Int {
    return num1 * num2
}

multiply2(3)
multiply2(3, num2: 7)

print("hi", 1, 2, separator: "-", terminator: ".")

//变长参数的函数
//PS: numbers 默认为 let 参数
func mean (numbers:Double ... ) -> Double{
    var sum:Double = 0
    for num in numbers {
        sum += num
    }
    return sum/Double(numbers.count)
}
mean(1)
mean(1, 2)
mean(1, 2, 3)

//inout 参数
//func swapTwoInts2 (a:Int, _ b:Int) {
//    let t:Int = a
//    a = b //a, b 默认为 let 参数
//    b = t
//}

//按引用传入(改变二者的值)
func swapTwoInts (inout a:Int, inout _ b:Int) {
//    let t:Int = a //二者互换
//    a = b
//    b = t
    
    (a, b) = (b, a) //二者互换,这样更简洁
}


//func swapTwoInts3 (inout a:Int, inout _ b:Int) {
//    (a, b) = (b, a) //二者互换
//}

var x = 1
var y = 3
swapTwoInts(&x, &y) //传递的是引用
x
y


//函数类型(函数本身当做变量)
func add(a:Int, _ b:Int) -> Int {
    return a + b
}

let anotherAdd = add //可以把函数当做一个变量传递 (类型为 (Int, Int) -> Int )
let anotherAdd2:(Int, Int) -> Int = add //与前者等效
anotherAdd(1, 2)

func sayHelloTo(name:String) -> () {
    print("Hello, \(name)")
}

let sayHello:String->() = sayHelloTo //(String) -> () 类型, 一个参数可以不加括号，即 String->() 或 String->Void

var arr0:[Int] = []
for _ in 0...10 {
    arr0.append(random()%100)
}

arr0.sort() //不改变数组的排序
arr0.sortInPlace() //改变数组的排序

func biggerNumerFirst(a:Int, _ b:Int) -> Bool {
//    if a > b {
//        return true
//    }
//    return false
    
    return a > b //与前者等效
}

arr0.sort(biggerNumerFirst) //变为从大到小排序

//三个函数
// map, Int->_ (任意类型), map 用于将每个数组元素通过某个方法进行转换。
arr0
func changeNum(a:Int) -> Int {
    return a + 3
}

func isPass(a:Int) -> Bool {
    return a > 60 ? true : false
}
arr0.map(changeNum) //整型变为任意类型
arr0.map(isPass)


// filter, Int->Bool, filter 用于选择数组元素中满足某种条件的元素。
func fail(a:Int) -> Bool {
    return a < 60
}
arr0.filter(fail)

// reduce, reduce 方法把数组元素组合计算为一个值。
func add3(num1:Int, _ num2:Int) -> Int{
    return num1 + num2
}
arr0.reduce(0, combine: add3) //数组求和
arr0.reduce(0, combine: +) //与前者等效

func concatenate(str:String, num:Int) -> String {
    return str + String(num) + ". "
}

arr0.reduce(": ", combine: concatenate) //





//闭包（Closure, 本质是函数，类似匿名函数或 Block）
arr0.sort({ (a:Int, b:Int) -> Bool in
    return a > b
})

//简化
arr0.sort({ (a:Int, b:Int) -> Bool in return a > b }) //一行代码的可以这么写
arr0.sort( {a, b in return a > b} ) //因为 sort 中函数的类型是固定的
arr0.sort( {a, b in a > b} ) //OK
arr0.sort( {$0 > $1} ) //更简洁(使用默认的命名)
arr0.sort(>) //OMG!
arr0.sort(<)

//Trailing Closure (函数为最后一个参数)
arr0.sort(){a, b in return a > b}
arr0.sort(){ a, b in
    return a > b
}
arr0.sort{ a, b in //() 可以省略
    return a > b
}


//arr0.map{ ( number) -> String in
//    var
//}

//内容捕获(可能产生内存问题)
var num = 50
arr0.sort( { a, b in
    abs(a-100) < abs(b-100)
} )


//闭包和函数是引用类型（之前的基本类型是值类型）

func runningMeters(metersPerDay:Int) -> () -> Int {
    var totalMeters = 0
    return { //返回的是闭包
        totalMeters += metersPerDay
        return totalMeters //每天跑多少
    }
}

var planA = runningMeters(2000)
planA() //为何不是2000？注意后面的小括号。。。
//print(planA)
planA()
planA()

var planB = runningMeters(3000)
planB()
planB()

var anotherPlanB = planB
anotherPlanB()

planB() //说明函数和闭包是引用类型

let planC = runningMeters(5000)
planC()
planC()


//慕课网：玩儿转Swift 2.0（第二季）