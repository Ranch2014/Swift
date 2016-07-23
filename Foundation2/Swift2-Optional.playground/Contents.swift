//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//可选型
var code:Int? = nil //整型的可选型
var color:UIColor? = nil


var errorCode:String? = "404" //字符串的可选型 (String? 类型)

//errorCode = nil

print(errorCode)

//"The errorCode is " + errorCode //error, 可选型不能直接使用

//解包
"The errorCode is " + errorCode! //强制解包，保证该值不为 nil (有风险)

"The errorCode is \(errorCode)"

//一般做法
if errorCode != nil {
    "The errorCode is " + errorCode!
}

//Swift 新的语法 (和前者等效)
if let errorCode = errorCode {
    "The errorCode is " + errorCode //errorCode 是 String 类型
}

var errorMessage:String? = "Not found"

//解包多个变量
if let errorCode = errorCode,
    errorMessage = errorMessage {
        print("OK")
}

//还可增加逻辑判断，例如
if let errorCode = errorCode,
    errorMessage = errorMessage where errorCode == "404" {
        print("OK")
}


//1. Optional Chaining
if let errorMessage = errorMessage {
    errorMessage.uppercaseString
}

errorMessage?.uppercaseString //与前者等效

//errorMessage!.uppercaseString //errorMessage 为 nil 时会报错

var uppercaseErrorMessage = errorMessage?.uppercaseString //uppercaseErrorMessage 是String? 类型

if let uppercaseErrorMessage = errorMessage?.uppercaseString {
    uppercaseErrorMessage
}

//2. nil coalescing
var error:String? = nil
let message:String //这里的 massage 未赋值，不能使用
if let errorMessage = error {
    message = errorMessage
}
else {
    message = "no error"
}

let message2 = error == nil ? "no error" : error //使用三目运算符

let message3 = error ?? "no error" //新语法，与前二者等效

//元组可选型
var error1:(errorCode:Int, errorMessage:String?) = (404, "Not found")
error1.errorMessage = "hi" //OK
//error1 = nil //error


var error2:(errorCode:Int, errorMessage:String)? = (404, "Not found")
//error2.errorMessage = "hi" //error
error2 = nil //OK

var error3:(errorCode:Int, errorMessage:String?)? = (404, "Not found")



var ageInput:String = "12"
var age = Int(ageInput) //强转为 Int 类型 (age 是 Int? 型)

//if let 解包
if let age = Int(ageInput) where age < 20 {
    print("young")
}

var greeting = "hello"
greeting.rangeOfString("ll") //返回值为可选型
greeting.rangeOfString("lol")

//隐式可选型
var errMessage:String! = nil //也是可选型，不用解包
errMessage = "not found"
"the message is " + errMessage //为空的时候报错

class City {
    let cityName:String
    //    var country:Country
    unowned var country:Country
    init (cityName:String, country:Country) {
        self.cityName = cityName
        self.country = country
    }
}

class Country {
    let countryName:String
    var capitalCity:City! //隐式可选型
    init (countryName:String, capitalCity:String) {
        self.countryName = countryName
        self.capitalCity = City(cityName: capitalCity, country: self)
    }
    
    func showInfo() {
        print("This is \(countryName)")
        print("capital is \(capitalCity)")
    }
}

let china = Country(countryName: "China", capitalCity: "Beijing")
china.showInfo()

