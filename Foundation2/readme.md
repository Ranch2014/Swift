#可选型

可选型是 `Swift` 语言中的一种类型，其写法为基本数据类型后加一个问号，表示某个变量可能是 `nil` 。

- 声明

其声明如下所示：

```Swift
var number:Int? = nil //整型的可选型 (可选型可以初始化为 nil)
var errorCode:String? = "404" //字符串的可选型 (String? 类型)
var errorMessage:String? = "Not found"

print(errorCode) //打印结果为 Optional("404")
```

可选型不能直接使用，需要进行解包：

```swift
"The errorCode is " + errorCode //error, 可选型不能直接使用
```

- 解包

解包，即获取可选型变量的值。

```swift
//强制解包 (可选型后加叹号)，保证该值不为 nil (该做法有风险，若为 nil 则会报错)
"The errorCode is " + errorCode!

//一般做法
if errorCode != nil {
    "The errorCode is " + errorCode!
}

//Swift 新的语法 (if...let 解包)
if let errorCode = errorCode {
    "The errorCode is " + errorCode //二者可同名，前者是 String 类型，后者为 String? 类型
}

//多个可选型变量同时解包，示例代码：
if let errorCode = errorCode,
    errorMessage = errorMessage {
        print("OK")
}

//此外，还可增加逻辑判断，例如添加 where：
if let errorCode = errorCode,
    errorMessage = errorMessage where errorCode == "404" {
        print("Not found")
}
```

- Optional Chaining

Optional Chaining: 自动判断链

```swift
//对一个可选型解包后，并进行一些操作
if let errorMessage = errorMessage {
    errorMessage.uppercaseString
}

errorMessage?.uppercaseString //返回值类型为可选型。该写法与前者等效
//errorMessage!.uppercaseString //若这样写 errorMessage 为 nil 时报错

var uppercaseErrorMessage = errorMessage?.uppercaseString //uppercaseErrorMessage 是String? 类型

if let uppercaseErrorMessage = errorMessage?.uppercaseString {
    uppercaseErrorMessage
}
```

- nil coalescing

```swift
var error:String? = nil
let message:String //这里的 massage 未赋值，不能使用
if let errorMessage = error {
    message = errorMessage
}
else {
    message = "no error"
}

//若使用三目运算符
let message2 = error == nil ? "no error" : error

//若使用 Swift 新语法（与前面二者等效。即优先取 error 的值，若为 nil, 则为 ?? 后的值）
let message3 = error ?? "no error"
```

- 隐式可选型

基本类型后加感叹号，例如：

```swift
var errMessage:String! = nil //也是可选型，不用解包
errMessage = "not found"
"the message is " + errMessage //为空的时候报错
```

#数组

- 声明

```swift
var numbers = [1, 2, 3, 4, 5] 
var strs = ["A", "E", "I", "O", "U"]

//显式声明
var numbers: [Int] = [1, 2, 3, 4, 5]
var strs:Array<String> = ["A", "E", "I", "O", "U"]

//声明空数组（四种方式均可）
var emptyArr1:[Int] = []
var emptyArr2:Array<Int> = []
var emptyArr3 = [Int]()
var emptyArr4 = Array<Int>()
```

- 常用方法

```swift
numbers.count //数组长度
numbers.isEmpty //是否为空
numbers[4] //第几个元素
numbers.first //第一个元素。注：返回值为可选型
numbers.last //最后一个元素。返回值为可选型
numbers.contains(1) //是否包含某个元素

numbers.minElement() //最小值
numbers.maxElement() //最大值

strs.minElement() //OK, 字符串型的数组也可以比较
strs.maxElement()

numbers[1..<3] //获得子数组

numbers.indexOf(3) //某个元素的索引，若没有，则返回 nil
```

- 遍历

```swift
//方式一
for index in 0..<numbers.count {
    print(numbers[index])
}

//方式二
for index in numbers {
    print(index)
}

//新的遍历方式，可以同时获得索引和值
for (i, value) in strs.enumerate() {
    print("\(i): \(value)")
}
```

- 比较

两个数组可以进行比较，例如：

```swift
var numbers = [1, 2, 3, 4, 5] 
var oneToFive = [1, 2, 3, 4, 5]
numbers == oneToFive //true, 这里比较的是值，而非引用
```
注意：若顺序不同，则不相等。因为数组是有序的！

- 增删改

```swift
//向数组中添加元素
numbers.append("hello") //向数组中添加元素（到末尾）
numbers.append(8) //数组中添加元素（到末尾）

numbers += [7, 9] //数组连接，后者要为数组

numbers.insert(10, atIndex: 5) //插入到指定位置(注意越界问题)

//删除元素
numbers2.removeLast() //移除最后一个元素
numbers2.removeFirst() //移除第一个元素
numbers2.removeAtIndex(3) //移除指定索引的元素
numbers2.removeRange(0..<2) //移除某个范围内的元素
numbers2.removeAll() //删除全部

//修改元素
numbers[1] = 3 //修改某个元素
numbers[0...2] = [2, 2] //修改某个区间的元素(注意越界问题)
```

- 二维数组

```swift
//声明
var arr = [[1, 1], [2, 3, 5], [8, 13, 21, 34]] //[Array<Int>] 类型
var arr:[[Int]] = [[1], [2, 3], [3, 4]] //显示声明
var arr:Array<Array<Int>> = [[1, 2], [2, 3], [3, 4]]

arr[0] //第一行
arr[0][0] //第一行的第一个元素

arr.count //数组的长度
arr[0].count //一行的个数

arr[0].append(0) //第一行添加一个元素

arr.append([1, 2, 3, 4]) //添加一行

arr += [[0, 0]] //二维数组添加一个元素

arr[0] += [0, 0] //第一行添加两个元素
```

#字典和集合

- 声明

```swift
var dict = ["hi":1, "hello":2]

//显示声明
var dict:[String : String] = ["swift":"雨燕；迅速的", "python":"大蟒"]
var dict:Dictionary<String, String> = ["swift":"雨燕；迅速的", "python":"大蟒"]

//声明空的字典
var emptyDict1:[String:Int] = [:]
var emptyDict2:Dictionary<String, Int> = [:]
var emptyDict3 = [String:String]()
var emptyDict4 = Dictionary<String, String>()
```

- 解包

```swift
dict["swift"] //获取 swift 对应的值，返回可选型，因为可能不存在

if let value = dict["swift"] {
    print(value)
}
```

- 常用方法

```swift
dict.count //多少键值对
dict.isEmpty //是否为空
Array(dict.keys) //获取所有的 key
Array(dict.values) //获取所有的 value
```

- 遍历

```swift
//遍历 key
for key in dict.keys {
    print(key) //注意：字典是无序的数据集合s
}

//遍历获取 key, value
for (key, value) in dict {
    print("\(key) : \(value)")
}
```

- 比较

```swift
let dict1 = [1:"a", 2:"b", 3:"c"]
let dict2 = [3:"c", 1:"a", 2:"b"]
dict1 == dict2 //true, 比较的是值，和顺序无关，但键不能重复
```

- 删改

```swift
var dict = ["name":"Luffy", "occupation":"pirate"]

//修改
dict["name"] = "Zoro" //注意：若 key 存在，则修改；若不存在，则增加进去
dict.updateValue("swordsman", forKey: "occupation") //返回的是修改前的值（可选型，可用于修改密码的提示）

//删除
dict["name"] = nil //删除某个键值对
dict.removeValueForKey("name") //返回删除掉的值(可选型，类似 updateValue)

if let name = dict.removeValueForKey("name") {
    print(name)
}

dict.removeAll() //清空
```

- 集合

集合 Set: 无序；不重复。

- 声明

```swift
var skillOfA:Set<String> = ["Swift", "OC", "OC"] //若不显示声明，则为数组而非集合

//声明空的集合
var emptySet1:Set<Int> = []
var emptySet2 = Set<Double>()

Set([1, 2, 3, 1]) //将数组转为集合
```

- 常用方法

```swift
skillOfA.count
skillOfA.isEmpty
skillOfA.first //由于 Set 是无序的，因此这里是随机取一个元素
skillOfA.contains("OC") //是否包含某元素
```

- 遍历

```swift
for skill in skillOfA {
    print(skill)
}
```

- 比较

```swift
let set1:Set = [1, 2, 3]
let set2:Set = [2, 3, 1, 2, 3, 1]
set1 == set2 //true, 重复的不算
```

- 增删改

```swift
var skillOfB:Set<String> = ["HTML", "CSS", "Java"]

//插入元素
skillOfB.insert("OC")
skillOfB.insert("Java") //若已有，则不变

//删除元素
skillOfB.remove("OC") //返回的是要删除的元素，可选型
skillOfB.remove("JS") //nil

if let skill = skillOfB.remove("Java") {
    print("成功删除 \(skill)")
}
```

- 个性化操作

一些数学中的交集、并集等概念。

```Swift
var skillOfA:Set<String> = ["Swift", "OC", "OC"]
var skillOfB:Set<String> = ["HTML", "CSS", "Java"]

//并集
skillOfA.union(skillOfB) //二者的并集（二者均不改变）
skillOfA.unionInPlace(skillOfB) //并集（前者改变）

//交集
skillOfA.intersect(skillOfB) //二者的并集（不改变值）
skillOfA.intersectInPlace(skillOfB) //二者的并集，返回给前者

//减法
skillOfA.subtract(skillOfB) //A 减去 A 和 B 的交集（即得到 A 独有的元素, 不改变 A）
skillOfA.subtractInPlace(skillOfB) //改变 A

//异或
skillOfA.exclusiveOr(skillOfB) //返回二者不同的元素集合

skillOfA.union(["Android", "Java"]) //可以和一个数组求并集

//子集
skillOfA.isSubsetOf(skillOfA) //子集
skillOfA.isStrictSubsetOf(["OC", "Swift", "Java"]) //OK, 真子集

//超集
skillOfA.isSupersetOf(["Swift"]) //true
skillOfA.isStrictSupersetOf(["OC"]) //true

//相离(两个集合没有公共元素)
skillOfA.isDisjointWith(skillOfB) //false
skillOfA.isDisjointWith(["Java"]) //true

```

#函数

- 声明

```swift
func 函数名(参数) -> 返回值类型

//示例代码 ( 这里的参数类型为 String?, 返回值类型为 String )
func sayHelloTo(name:String?) -> String {
    return "Hello, " + (name ?? "Guest")
}

var nickName:String? = nil
sayHelloTo(nickName) //函数调用（注意不要忘记后面的括号）

//无参无参返回值函数的声明 (三种方式)，无返回值的函数
func printHello() {
    print("Hello")
}

func printHello() -> () {
    print("Hello")
}

func printHello() -> Void {
    print("Hello")
}

printHello() //调用（注意不要忘记后面的括号）
```

- 多参函数

```swift
//声明多参数的函数
func sayName(firstName:String, lastName:String) -> String {
    return "Hello! " + firstName + " - " + lastName
}

//注意：调用多参函数时，第二个参数及以后的参数名要写
sayName("Edward", lastName: "Newgate")

//lastNameIs 是外部参数名（即给外部调用时的参数名。第一个参数也可设置外部参数名）
func sayName2(firstName:String, lastNameIs lastName:String) -> String {
    return "Hello! " + firstName + " - " + lastName
}

//lastNameIs 是外部参数名
sayName2("Edward", lastNameIs: "Newgate")

//忽略参数的名字（调用时无需写该参数的名字），可在参数名前加下划线 _ , 例如
func multiply(num1:Int, _ num2:Int) -> Int {
    return num1 * num2
}
multiply(3, 7)
```

- 有默认值的函数

```swift
func multiply(num1:Int, num2:Int = 10) -> Int {
    return num1 * num2
}

multiply(3) //30
multiply(3, num2: 7) //21

//也可设置多个参数有默认值。若如此，则有默认值的参数顺序可以改变。
```

- 变长参数的函数

```swift
func mean (numbers:Double ... ) -> Double{
    var sum:Double = 0
    for num in numbers {
        sum += num
    }
    return sum/Double(numbers.count)
}
mean(1) //1
mean(1, 2) //1.5
mean(1, 2, 3) //2
```

- inout

按引用传入，即调用函数后值改变。

```swift
func swapTwoInts (inout a:Int, inout _ b:Int) {
//    let t:Int = a //二者互换
//    a = b
//    b = t
    
    (a, b) = (b, a) //使用元组来互换二者更简洁！
}

var x = 1
var y = 3
swapTwoInts(&x, &y) //这里传递的是引用，调用后值改变
```

- 函数类型

即，把函数当成一种数据类型。

```swift
//定义一个函数
func add(a:Int, _ b:Int) -> Int {
    return a + b
}

//可以把函数当做一个变量传递 (anotherAdd 的类型为 (Int, Int) -> Int )
let anotherAdd = add
let anotherAdd2:(Int, Int) -> Int = add //也可以显式声明，与前者等效

anotherAdd(1, 2) //调用

//若只有一个参数，参数类型可以不加括号，例如：
func sayHelloTo(name:String) -> () {
    print("Hello, \(name)")
}

//(String) -> () 类型, 一个参数可以不加括号，即 String->() 或 String->Void
let sayHello:String->() = sayHelloTo //可以这样显式声明
```


## 高阶函数

`Swift` 的标准数组支持三个高阶函数：`map`，`filter` 和 `reduce`。

  - map
`map` 用于将每个数组元素通过某个方法进行转换。

```swift
//map, Int->_ (任意类型)

//声明一个数组
var arr = [15, 21, 35, 49, 62, 77, 83, 86, 86, 92, 93]

//方法一
func changeNum(a:Int) -> Int {
    return a + 3
}

//方法二
func isPass(a:Int) -> Bool {
    return a > 60 ? true : false
}

arr.map(changeNum) //按照 changeNum 的规则改变数组 arr
arr.map(isPass) //按照 isPass 的规则改变数组 arr
```

  - filter

`filter` 用于选择数组元素中满足某种条件的元素。

```swift
//filter, Int->Bool

func fail(a:Int) -> Bool {
    return a < 60
}
arr.filter(fail)
```

  - reduce

`reduce` 方法把数组元素组合计算为一个值。

```swift
func add(num1:Int, _ num2:Int) -> Int{
    return num1 + num2
}
arr.reduce(0, combine: add) //数组求和。第一个参数为初始值
arr.reduce(0, combine: +) //或者这么写，与前者等效

func concatenate(str:String, num:Int) -> String {
    return str + String(num) + " "
}
arr.reduce("", combine: concatenate) //
```

#闭包

闭包（Closure）：本质是函数，类似匿名函数或 Block。

使用闭包可以对函数进行简化，例如：

```swift
func biggerNumerFirst(a:Int, _ b:Int) -> Bool {
//    if a > b {
//        return true
//    }
//    return false
    
    return a > b //与前者等效
}
arr.sort(biggerNumerFirst) //变为从大到小排序

//使用闭包可以这么写：
arr.sort({ (a:Int, b:Int) -> Bool in
    return a > b
})

//还可以进行如下简化：
arr.sort({ (a:Int, b:Int) -> Bool in return a > b }) //一行代码的可以这么写
arr.sort( {a, b in return a > b} ) //因为 sort 中函数的类型是固定的，所以类型可以不写
arr.sort( {a, b in a > b} ) //return 也可以不写
arr.sort( {$0 > $1} ) //更简洁 (使用默认的命名)
arr.sort(>) //OMG!

//注意代码简化和可读性之间的平衡，并非越简单越好。

//Trailing Closure (函数为最后一个参数)
arr.sort(){a, b in return a > b}
arr.sort(){ a, b in
    return a > b
}
arr.sort{ a, b in //() 可以省略
    return a > b
}
```

注意：闭包和函数是引用类型（之前的基本类型是值类型），即调用后会改变原先的值。

```swift
func runningMeters(metersPerDay:Int) -> () -> Int {
    var totalMeters = 0
    return { //返回的是闭包
        totalMeters += metersPerDay
        return totalMeters //每天跑多少
    }
}

var planA = runningMeters(2000)
planA() //注意后面的小括号。。。
planA() //再次调用会累加

var planB = runningMeters(3000)
planB()

var anotherPlanB = planB
anotherPlanB() //这样也会累加

planB() //说明函数和闭包是引用类型

//也可以使用 let 关键字，其含义是 planC 不能再改变，而非 runningMeters 不能改变
let planC = runningMeters(5000)
planC()
```


>[玩儿转Swift 2.0（第二季）](http://www.imooc.com/learn/642)