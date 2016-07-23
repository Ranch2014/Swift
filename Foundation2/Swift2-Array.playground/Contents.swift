//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//数组
var numbers:[NSObject] = [1, 2, 3, 4, "hi"] //NSObject 类型（不建议这么写）
var strs = ["A", "E", "I", "O", "U"]

var numbers2: [Int] = [1, 2, 3, 4, 5] //显式声明
var numbers3:Array<Int> = [1, 2, 3, 4, 5]

//声明空数组
var emptyArr1:[Int] = []
var emptyArr2:Array<Int> = []
var emptyArr3 = [Int]()
var emptyArr4 = Array<Int>()

var allZeros = [Int](count:5, repeatedValue:0)
var allZeros2 = Array<Int>(count:5, repeatedValue:1)

//数组常用方法
numbers.count //长度
//emptyArr1.count
numbers.isEmpty //是否为空
numbers[4] //第几个元素
numbers.first //第一个元素。注：返回值为可选型
numbers.last //最后一个元素

numbers2.minElement() //最小值
numbers2.maxElement() //最大值

strs.minElement() //OK
strs.maxElement()

numbers[1..<3] //获得子数组
numbers[2..<numbers.count]

numbers.contains(1) //是否包含

numbers.indexOf(3) //某个元素的索引，若没有，则返回 nil

//数组遍历
for index in 0..<numbers.count {
    print(numbers[index])
}

for index in numbers {
    print(index)
}

//新的遍历方式，可以同时获得索引和值
for (i, value) in strs.enumerate() {
    print("\(i): \(value)")
}

//数组比较
var oneToFive = [1, 2, 3, 4, 5]
numbers2 == oneToFive //这里比较的是值，而非引用

//注意：数组是一个有序的集合

//数组的增删改查
numbers.append("hello")
numbers2.append(8) //数组中添加元素（到末尾）

numbers2 += [7, 9] //后者要为数组

numbers2.insert(10, atIndex: 5) //插入到指定位置(注意越界问题)

//删除
numbers2.removeLast() //移除最后一个元素
numbers2
numbers2.removeFirst()
numbers2
numbers2.removeAtIndex(3)
numbers2
numbers2.removeRange(0..<2)
numbers2
//numbers2.removeAll() //删除全部
//numbers2

//修改
numbers2[1] = 3
numbers2

numbers2[0...2] = [2, 2, 2] //使用区间修改数组(注意越界问题)
numbers2


//二维数组(长度可以不同)
var arr = [[1, 1], [2, 3, 5], [8, 13, 21, 34]] //[Array<Int>] 类型
var arr2:[[Int]] = [[1], [2, 3], [3, 4]] //显示声明
var arr3:Array<Array<Int>> = [[1, 2], [2, 3], [3, 4]]

arr[0] //第一个数组
arr[0][0] //第一个数组的第一个元素

arr.count
arr[0].count

arr[0].append(0) //添加一个元素
arr

arr2.append([1, 2, 3, 4]) //添加一行

arr2 += [[0, 0]]
arr2[0] += [0, 0]
arr2





