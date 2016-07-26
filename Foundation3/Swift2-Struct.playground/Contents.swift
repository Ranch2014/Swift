//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//结构体
struct Location {
    let latitude:Double
    let longitude:Double
}

let appleHeadQuarterLocation = Location(latitude: 37.3230, longitude: -122.0322) //构造函数的方式赋值。顺序不能互换
let googleHeadQuarterLocation = Location(latitude: 37.4220, longitude: -122.0841)

//appleHeadQuarterLocation 和 latitude 都为 var 类型时才能对 latitude 进行修改
appleHeadQuarterLocation.latitude
//appleHeadQuarterLocation.latitude = 0 //error, 二者都为 var 类型才可以修改

//struct 类型的
struct Place {
    let location:Location
    var name:String
}

var googleHeadQuarter = Place(location: googleHeadQuarterLocation, name: "Google")
googleHeadQuarter.location.latitude //连续点语法


//构造函数
struct Location2 {
    var latitude:Double = 0 //可以赋初值
    var longitude:Double = 0
}

Location2() //赋初值后可以这样调用
Location2().latitude

//一般的变量若不赋初值，则没有初值；可选型若没有赋初值，默认初始为 nil

struct Location3 {
    let latitude:Double
    let longitude:Double
    
    //自定义构造函数 (使用 init 关键字)
    init(coordinateString: String){
        let commaIndex = coordinateString.rangeOfString(",")!.startIndex
        let firstElement = coordinateString.substringToIndex(commaIndex)
        let secondElement = coordinateString.substringFromIndex(commaIndex.successor())
        
        latitude = Double(firstElement)!
        longitude = Double(secondElement)!
    }
    
    //注意：若添加了自定义的构造函数后，默认的构造函数就不能用了
    //建议再写出默认的构造函数
    init(latitude:Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}

//可失败的构造函数
struct Location4 {
    let latitude:Double
    let longitude:Double
    
    init?(coordinateString: String){
        if let commaIndex = coordinateString.rangeOfString(",")?.startIndex {
            if let firstElement = Double(coordinateString.substringToIndex(commaIndex)) {
                if let secondElement = Double(coordinateString.substringFromIndex(commaIndex.successor())) {
                    self.latitude = firstElement
                    self.longitude = secondElement
                }
                else {
                    return nil
                }
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    init(latitude:Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}

//使用 guard 关键字重写
struct Location5 {
    let latitude:Double
    let longitude:Double
    
    init?(coordinateString: String){
        //使用 guard 关键字可以使条理更清晰
//        guard let commaIndex = coordinateString.rangeOfString(",")?.startIndex else {
//            return nil
//        }
//        guard let firstElement = Double(coordinateString.substringToIndex(commaIndex)) else {
//            return nil
//        }
//        guard let secondElement = Double(coordinateString.substringFromIndex(commaIndex.successor())) else {
//            return nil
//        }

        //还可以这样简写
        guard
            let commaIndex = coordinateString.rangeOfString(",")?.startIndex,
            let firstElement = Double(coordinateString.substringToIndex(commaIndex)),
            let secondElement = Double(coordinateString.substringFromIndex(commaIndex.successor()))
        else {
            return nil
        }
        
        self.latitude = firstElement
        self.longitude = secondElement
    }
    
    init(latitude:Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}


//struct 和 enum 都是值类型(区别引用类型)

//到处都是结构体
//Array, Dictionary, Set 都是结构体
//Int, Float, Double, Bool, String 都是结构体

Int.max

