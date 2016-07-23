//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//集合
//1.无序; 2.某些方法; 3.数据不重复

//声明
var skillOfA:Set<String> = ["Swift", "OC", "OC"]

//声明空的集合
var emptySet1:Set<Int> = []
var emptySet2 = Set<Double>()

Set([1, 2, 3, 1]) //数组转为集合

//常用方法
skillOfA.count
skillOfA.isEmpty
skillOfA.first //随机取一个，无序
skillOfA.contains("OC")

//遍历
for skill in skillOfA {
    print(skill)
}

let set1:Set = [1, 2, 3]
let set2:Set = [2, 3, 1, 2, 3, 1]
set1 == set2 //true


//增删改
var skillOfB:Set<String> = ["HTML", "CSS", "Java"]

skillOfB.insert("OC")
skillOfB.insert("Java") //若已有，则不变

//skillOfB.remove("OC") //返回的是要删除的元素
skillOfB.remove("JS") //nil

if let skill = skillOfB.remove("Java") {
    print("成功删除 \(skill)")
}

skillOfB

//skillOfB.removeAll() //清空

//个性化操作(一些数学概念)
skillOfA
skillOfB

//并集
skillOfA.union(skillOfB) //二者的并集, 此时二者均不改变
skillOfA

//skillOfA.unionInPlace(skillOfB) //并集，前者改变
//skillOfA

//交集
skillOfA.intersect(skillOfB) //二者的并集，不改变值
skillOfA

//skillOfA.intersectInPlace(skillOfB) //二者的并集返回给前者
//skillOfA

//减法
skillOfA
skillOfB

skillOfA.subtract(skillOfB) //A 减去 A 和 B 的交集，即，得到 A 独有的元素, 不改变 A
skillOfA

//skillOfA.subtractInPlace(skillOfB) //改变 A
skillOfA

//异或
skillOfA.exclusiveOr(skillOfB) //二者不同的元素

skillOfA
skillOfA.union(["Android", "Java"]) //可以是一个数组

//子集
skillOfA
skillOfA.isSubsetOf(skillOfA) //子集
skillOfA.isStrictSubsetOf(["OC", "Swift", "Java"]) //OK, 真子集

skillOfA
skillOfA.isSupersetOf(["Swift"]) //超集
skillOfA.isStrictSupersetOf(["OC"])

//相离(两个集合没有公共元素)
skillOfA
skillOfB

skillOfA.isDisjointWith(skillOfB)
skillOfA.isDisjointWith(["Java"])



