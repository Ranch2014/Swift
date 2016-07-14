#基本类型

- 变量和常量

使用 `var` 来声明变量，使用 `let` 来声明常量，示例代码：

```Swift
var myVariable = 42
myVariable = 50

let myConstant = "Hello"
```

>PS: 常量或变量的类型必须和你赋给它们的值一样。但不必明确地声明类型，声明的同时赋值的话，编译器会自动推断类型。

也可以显式声明变量，如下所示：

```Swift
let url:String = "www.abc.com" //显式声明 url 为 String 类型
var a, b, c : Double //显式声明 a, b, c 均为 Double 类型
```

- 各种进制表示

```Swift
let decimalInt:Int = 17 //十进制
let binaryInt:Int = 0b10001 //二进制
let octalInt:Int = 0o21 //八进制
let hexInt:Int = 0x11 //十六进制
```

- 布尔型

``` Swift
let imTrue:Bool = false;
if imTrue { //条件语句，不加括号。非0整型不能解读为布尔类型
    print("I'm true")
}
else {
    print("I'm false")
}

if 1+1==2 { //OK
    print("1 + 1 = 2")
}
```

- 浮点型

```Swift
let floatNum:Float = 3.1415926 //Float 精度为小数点后6位，因此实际结果为 3.141593
let doubleNum:Double = 3.1415926

//PS: 默认为 Double 类型
```

- Character

```Swift
//Character 可以表示汉字或表情（若不显式定义为 `Character` 类型，则为 `String` 类型）
let enLetter:Character = "a"
let cnLetter:Character = "你"
let dog:Character = "🐶"
let cool:Character = "\u{1F60E}"
```

- 元组

元组：将多个不同的值集合成一个数据。
特点：可以有多个值；不同的值可以是不同类型。
示例代码：

```Swift
//定义
var point = (1, 3)
var httpResponse = (404, "Not Found")

//显式定义，限定类型
var point2:(Int, Int, Int) = (1, 2, 4)
var httpResponse2:(Int, String) = (200, "OK")

//可以给变量命名，这样解包时可通过名字访问
var point3 = (x:1, y:2, z:4)
var point4:(x:Int, y:Int, z:Int) = (1, 2, 4)

//解包（即获取元组里的元素）
let (xx, yy) = point
httpResponse.0
httpResponse.1

//命名后即可用名字访问
point3.x
point4.y

//可用下划线 _ 表示对该变量不关心
let loginInfo = (true, "user")
let (isSuccess, _) = loginInfo
```

- 其他

``` Swift
//以科学计数法形式定义
var d = 1.2e5 //1.2*10^5
var e = 1.2e-5 //1.2*10^-5

//可用下划线 _ 分隔大数，便于区分。例如定义一百万
let bigNum = 1_000_000
```
此外，变量还可以命名为汉字（或其他 Unicode8 编码的字符）或表情符号，例如：

``` swift
var 名字 = "Ace"
var 😀 = "smile"

print(名字, 😀)
print(名字, 😀, separator:" - ") //自定义 print 分隔符（默认是空格）
print(名字, 😀, separator:"--", terminator:", end") //自定义结束符（默认是回车 \n）
// 注意：单词不要拼错了
```

还可以在 `print` 中使用 `\()` 方便的显示变量，例如：

``` Swift
let i=2, j=3, k=5
print("\(i) * \(j) * \(k) = \(i*j*k)") //打印结果：2 * 3 * 5 = 30\n
```

#运算符

- 算数运算符

``` Swift
let x1:UInt8 = 12
let x2:UInt16 = 21

//二者必须强制转换为相同类型才能进行运算
let m = UInt16(x1) + x2 //注意强转的写法
let n = x1 + UInt8(x2)
```

#逻辑控制语句

- for

`for..in` 循环示例代码：

``` Swift
for index in 1...5 { //... 前后都是闭区间
    index
//    index = 3 //error, 这里的 index 是常量
}

for index in 1..<5 { //..< 前闭后开区间
    index
}
```

若不关心循环到了多少次，可以这么写：

```
var result = 1
var base = 2
for _ in 1...10 { //忽略第几次
    result *= base
}
```

此外，有时为了跳出多个循环嵌套，可以给循环命名，例如：

```Swift
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
```

- while

`while` 循环：

```Swift
var i = 0
while i < 3 {
    print(i)
    i++
}
```

`repeat..while` 循环（相当于 `do..while`）：

```Swift
var j = 0
repeat {
    j++
    print(j)
} while j < 3
```

- switch

与 `C`, `Java` 等语言相比，`Swift` 语言的 `switch` 语句有许多变化。

``` Swift
var rating = "a"
switch rating {
case "A", "a": //判断多种不同的值
    print("great")
case "B":
    print("so-so")
case "C":
    print("bad")
default : //switch 必须穷举所有情况
    print("error")
}
```

>注意: case 语句后无需 break, 执行一个 case 后自动跳出。

`case` 后可以是布尔类型或浮点型等，例如：

``` Swift
let b = true
switch b {
case true:
    print("true")
default:
//    print("false")
//    break
    () //若无任何操作，可用 break 或 () 来结束
}
```

`switch` 高级用法，`switch` 后还可以是一个区间，例如：

```Swift
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
```

`switch` 还可以配合元组使用，例如：

```Swift
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
```

配合关键字 `fallthough` 使用：

```Swift
let point2 = (0, 0)
switch point2 {
case (0, 0):
    print("origin")
    fallthrough //穿透 case，但下层 case 中不能声明变量
case (_, 0):
    print("x-axis")
    print("value of x is \(x)")
case (0, let y):
    print("y-axis")
    print("value of y is \(y)")
case (let x, let y):
    print("the point is (\(x), \(y))")
}
```

配合关键字 `where` 使用：

```Swift
let point3 = (2, 2)
switch point3 {
case (let x, let y) where x == y: //where 又增加了限制条件
    print("It's on the line x=y")
case let (x, y) where x == -y:
    print("It's on the line x=-y")
case let (x, y):
    print("the point is (\(x), \(y))")
}
```

此外，`case...where` 也可以用在 `if` 语句中，例如：

```Swift
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
```

- guard 关键字

这是 `Swift` 中的新特性，示例代码：

``` Swift
//一般函数 (func 是定义函数的关键字)
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

//使用 guard 关键字后的函数（与前者等效）
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
```

使用 `guard` 关键字可以把核心逻辑不相关的分隔开，使程序条理更清晰。还有其他用法，以后再总结。

#字符串

- 声明

``` Swift
//声明字符串
var str = "Hello, playground"
var str:String = "Hello, playground" //显式声明
var str = String("Hello, playground")

//声明空的字符串
var emptyString = ""
var emptyStr = String()
var emptyStr = String("")
```

- 字符串连接

```
var mark = "!!!"
str + mark //不改变 str 的值
str += mark //改变 str 的值
```

- 遍历

```Swift
//遍历字符串中的每一个字符
for c in str.characters {
    print(c)
}
```

- 索引

```Swift
var str = "Hello, Swift"

str.characters.count //字符串长度, 12

var startIndex = str.startIndex //首位字符索引, 0. (闭区间, 即包含该索引位)
str[startIndex] //获取首位字符, 即 "H"
str[startIndex.successor()] //获取后一位对应的字符, 即 "e"
str[startIndex.advancedBy(2)] //距离，类似偏移量, 即 "l"

str.endIndex //末位字符索引, 12. (开区间, 不包含该索引位)
str[endIndex.predecessor()] //获取末位字符, 即 "t"
str[endIndex] //error, 这样是错误的，越界了
```

>注意：索引是前闭后开的，即 [startIndex, endIndex)

增删字符：

```swift
//添加字符到指定位置
str.insert("?", atIndex: endIndex)

//移除最后一个字符
str.removeAtIndex(endIndex.predecessor())
```

- 区间

```swift
//Range<Index> 类型，可以移除字符串中的一个子字符串
var range = startIndex..<endIndex

//移除某个区间内的字符串 (PS: 这里全部移除了)
str.removeRange(startIndex..<endIndex)
```

- 常用方法

```Swift
str.isEmpty //判空
str.characters.count //字符串的长度（解析字符串长度时，一个汉字或一个表情都算一个长度）
str.uppercaseString //转大写
str.lowercaseString
str.capitalizedString //首字母大写
str.containsString("af") //是否包含某字符串
str.hasPrefix("ca") //判断前缀
str.hasSuffix("end") //判断后缀

str.append(mark2) //字符串后添加一个字符(Character)，会改变 str 变量
str + String(mark2)

str.appendContentsOf("---") //添加字符串
```

- 转义符

常见的如下：

```swift
var s = "\"" //双引号 "
var t = "\t" //制表符
var n = "\n" //换行符
```

- 其他

根据需要保留相应的小数位数： 

```swift
let s0 = "one third is \(1.0/3.0)" //0.333333333333333
var s1 = String(format: "one third is %.2f", 1.0/3.0) //0.33
```

格式化字符串：

```swift
let s2 = " -- hello --- " as NSString //转为NSString类型

//去除空格和下划线
s3.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " -"))
```


>总结自 [玩儿转Swift 2.0（第一季）](http://www.imooc.com/learn/635)