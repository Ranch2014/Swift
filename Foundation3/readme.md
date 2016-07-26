#枚举

- 声明

```swift
//enum 关键字
enum Season { //新的数据类型，首字母大写
    case Spring
    case Summer
    case Autumn
    case Winter
}

//也可以这样简写
enum Season {
    case Spring, Summer, Autumn, Winter
}
```

- 获取

```swift
var season = Season.Summer
var season:Season = Season.Summer //显式
var season:Season = .Summer //可以这么简写
```

- 原始值

可以给枚举变量赋原始值 (Raw Value)，例如：

```swift
enum Fruit:Int {
    case Apple = 1
    case Orange = 2
    case Banana = 3
    case Watermelon = 4
}

let fruit = Fruit(rawValue: 2) //返回值为可选型
Fruit.Watermelon.rawValue //4

//解包
if let fruit = Fruit(rawValue: 2) {
    //do something
}
```

此外，关于原始值，还有其他用法，例如：

```swift
//可以只写第一个，后面的会依次加1
enum Fruit:Int {
    case Apple = 1, Orange, Banana, Watermelon
}

//也可以都不写，则默认从0开始，依次加1
enum Fruit:Int {
    case Apple, Orange, Banana, Watermelon
}

//定义是整型值的也可以不连续
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

//若不初始化，则默认是定义的字符
enum ProgrammingLanguage:String {
    case Swift, Java, OC //即，分别是 "Swift", "Java", "OC"
}
```

- 关联值

关联值（Associate Value）：可以关联不同类型，而且可修改（与 Raw Value 互斥），例如：

```swift
enum ATMStatus {
    case Success(Int)
    case Error(String)
}

//也可有部分没有关联值
enum ATMStatus {
    case Success(Int)
    case Error(String)
    case Waiting //无关联值
}
```

使用举例：

```swift
var balance = 1000 //余额
func withdraw(amount:Int) -> ATMStatus {
    if balance >= amount {
        balance -= amount
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
```

此外，还可以关联多个值（其实是关联了一个元组），例如：

```swift
enum Shape {
    case Square(side:Double) //可以分别关联不同的值
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
    case let .Circle( _, _, radius): //忽略一些变量
        return M_PI * radius * radius //M_PI 为 π
    case .Point:
        return 0
    }
}

//使用
let square = Shape.Square(side: 3)
let rectangle = Shape.Rectangle(width: 5, height: 3)
let circle = Shape.Circle(centerX: 6, centerY: 7, radius: 3)
let point = Shape.Point
```

- 递归枚举

```swift
//使用关键字 indirect
indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression) //调用了本身
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

//或者这样写
enum ArithmeticExpression2 {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
```

```swift
//计算 (5 + 4) * 2 举例：
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
```

- 修改自身变量

枚举中，若想通过方法对自身变量进行修改，需要使用 `mutating` 关键字，例如：

```swift
enum Switch {
    case On
    case Off
    
    mutating func click() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}
```

#结构体

- 声明

```swift
//struct 关键字
struct Location { //新的数据类型，首字母大写
    let latitude:Double //若不初始化，则默认没有值。且 let 只能初始化一次
    let longitude:Double
    var placeName:String? //若为可选型，默认初始化为 nil 
}

//初始化一个结构体（调用了默认的构造函数，参数顺序不能变）
let appleHeadQuarterLocation = Location(latitude: 37.3230, longitude: -122.0322) 
//注意：只有 appleHeadQuarterLocation 和 latitude 都为 var 类型时才能对 latitude 进行修改。

//结构体中变量的类型也可以是结构体，例如：
struct Place {
    let location:Location //Location 为结构体类型
    var name:String
}
```

- 构造函数

```swift
struct Location2 {
    var latitude:Double = 0 //可以赋初值
    var longitude:Double = 0
}

Location2() //赋初值后可以这样使用，调用了默认的构造函数
Location2().latitude
```

自定义构造函数：

```swift
struct Location3 {
    let latitude:Double
    let longitude:Double
    
    //自定义构造函数 (使用 init 关键字)
    init(coordinateString: String){
        let commaIndex = coordinateString.rangeOfString(",")!.startIndex //这里暂时使用了强制解包，后文再解决这个问题
        let firstElement = coordinateString.substringToIndex(commaIndex)
        let secondElement = coordinateString.substringFromIndex(commaIndex.successor())
        
        latitude = Double(firstElement)!
        longitude = Double(secondElement)!
    }
    //注意：若添加了自定义的构造函数后，默认的构造函数就不能用了
    //此时，建议再写出默认的构造函数，即：
    init(latitude:Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}
```


- 可失败的构造函数

结构体可以有可失败的构造函数（Failable-Initializer ），即，如果构造失败，返回为 `nil`。例如：

```swift
struct Location {
    let latitude:Double
    let longitude:Double
    
    //可失败的构造函数
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
```

上述构造函数使用了多个 `if...else` 语句，看起来很复杂。我们可以使用 `guard` 关键字来简化，使代码条理更清晰。例如：

```swift
struct Location {
    ...
    
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

        //还可以更加简洁的这样写
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
    
    ...
}
```

- 修改自身变量

同枚举一样，结构体中，若想使用方法对自身变量进行修改，也需要使用关键字 `mutating`，例如：

```swift
struct Location {
    var x = 0
    mutating func go() { //自己改变自己
        self.x += 1
    }
}
```

#类

- 声明

`Swift` 中的类和结构体很相似。使用关键字 `class`，示例如下：

```swift
class Person {
    //成员变量
    var firstName:String
    var lastName:String
    var career:String? //可选型变量可以不初始化，默认为 nil
 
    //构造函数
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
}
```

- 可失败的构造函数

同结构体一样，类也有可失败的构造函数，构造对象失败后返回 `nil`。例如：

```swift
init?(fullName:String){
    guard
        let spaceindex = fullName.rangeOfString(" ")?.startIndex
    else {
        return nil
    }
    self.firstName = fullName.substringToIndex(spaceindex)
    self.lastName = fullName.substringFromIndex(spaceindex.successor())
}
```

- 引用类型

类是引用类型。

```swift
let person1 = Person(firstName: "Edward", lastName: "Newgate")
let person2 = person1
person2.firstName = "Steve"
person2.lastName = "Jobs"
person2.career = "CEO"

//对 person2 修改时，person1 也改变了。(因为二者指向的是同一个对象)
```

- 类的等价

判断类的两个对象是否等价，判断的是其引用是否指向同一块内存。使用 `===` 表示，例如：

```swift
person1 === person2 //false, 判断引用类型(比较的引用，是否指向同一块内存)
person1 === person3 //true

person1 !== person2 //true, 不等于，即不是同一块内存
```

##属性和方法

- 计算属性

计算属性：依赖其他属性而存在的属性。

```swift
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

class Rectangle {
    var origin = Point()
    var size = Size()
    
    //计算属性
//    var area:Double{
//        return size.width * size.height
//    }
    //也可以这样声明
    var area:Double{
        get{
            return size.width * size.height
        }
    }
    
    //getter, setter
    var center:Point { //必须为 var 类型，且显式声明类型
        //getter
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        //setter
//        set(newCenter) {
//            origin.x = newCenter.x - size.width/2
//            origin.y = newCenter.y - size.height/2
//        }
        set { //可以这么写，newValue 是默认值
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }

    init(origin:Point, size:Size){
        self.origin = origin
        self.size = size
    }
}
```

- 类型属性

类型属性，即类的属性，相当于静态变量，使用 `static` 关键字。例如：

```swift
class Player {
    var name:String
    var score = 0 //个人总分
    static var highestScore = 0 //所有玩家最高分，类的属性 (static 关键字)
    
    init(name:String){
        self.name = name
    }
}
```

- 类型方法

类型方法，即类的方法，相当于静态方法，使用 `static` 关键字。例如：

```swift
class Matrix {
    var m:[[Int]] //二维数组
    var row:Int
    var col:Int
    
    ...

    //类方法，生成单位矩阵
    static func identityMatrix(n:Int) -> Matrix? {
        if n <= 0 {
            return nil
        }
        
        var arr2d:[[Int]] = []
        for i in 0..<n {
            var row = [Int](count:n, repeatedValue:0) //生成一行全为0的元素
            row[i] = 1
            arr2d.append(row) //添加到二维数组中
        }
        return Matrix(arr2d)
    }
}
```

- 属性观察器

属性观察器可以监测一个属性，在其将要改变或改变后进行一些操作。示例代码如下：

```swift
class LightBulb {
    static let maxCurrent = 30

    var current = 0 {
        //赋值前的逻辑
//        willSet(newCurrent){ //新的值，可以省略不写，使用系统默认值 newValue
//            print("new current is \(newCurrent)")
//        }
        
        willSet{ //效果同前者
            print("new current is \(newValue)")
        }
        
        //赋值完成后做的事情
        didSet(oldCurrent){ //oldCurrent 表示原来的值，可以省略不写，使用系统默认值 oldValue
            if current == LightBulb.maxCurrent {
                print("The current value get to the maximum point.")
            }
            else if current > LightBulb.maxCurrent {
                print("current too hight, falling back to previous one.")
                current = oldCurrent
            }
            print("The current is \(current)")
        }
    }
}
```

- 延迟属性

延迟属性，`lazy` 关键字。一个属性加载一次后保存其结果，避免每次都重新加载。示例代码：

```swift
class Book {
    let name:String
    //延迟属性
    lazy var content:String? = {
        return nil
    }()
    
    init(name:String){
        self.name = name
    }
}
```

- 访问控制

public: 可以被模块外访问。  
internal: 可以被本模块访问。  
private: 可以被本文件访问。  

##继承和构造函数

- 继承

示例代码（这里 Guldan 类继承自 Hero 类）：

```swift
public class Hero {
    var name:String
    var life:Int = 100
    
    public init(name:String){
        self.name = name
    }
}

final class Guldan: Hero {
    
}
```
注：若不想一个类被继承，可在前面添加 `final` 关键字。

- 重写

重写/覆盖 (关键字`override`)，就是子类重写父类的属性和方法。示例代码：

```swift
//父类
public class Hero {
    var name:String
    var life:Int = 100
    
    var description:String{
        return "I'm \(name)."
    }
    
    func beAttacked(attack:Int) {
        life -= 10
    }
    
    public init(name:String){
        self.name = name
    }
}

//子类，使用了 final 关键字， 该类不可被继承
final class Guldan: Hero {
    //属性重写 (override 关键字)
    override var description: String{
        return "Your soul belongs to me!"
    }
    
    //构造方法重写
    override init(name: String) { //构造方法重载
        self.group = ""
        print("my name is \(name)")
        super.init(name: name)
    }
    
    //方法重写
    override func beAttacked(attack: Int) {
        life -= 15
    }
}
```

注：若不想方法被重写，可以在方法前使用 `final` 关键字。

- 便利构造函数和指定构造函数

便利构造函数（关键字 `convenience`），是在构造函数中调用了其他的构造函数。而其他的构造函数则成为指定的 (designated) 构造函数。示例代码：

```swift
//父类
public class Hero {

    ...
        
    //指定的构造函数
    public init(name:String){
        self.name = name
    }
}

//子类
final class Guldan: Hero {
    
    //构造函数重写
    override init(name: String) { //构造方法重载
        self.group = ""
        print("my name is \(name)")
        super.init(name: name)
    }
    
    //便利的构造函数
    convenience init(firstName:String, lastName:String){
        self.init(name:firstName + " " + lastName) //调用指定的初始化函数
    }
    
    ...
}
```

- 构造函数的继承

子类构造函数的继承原则：  
1. 如果子类没有实现任何父类的指定构造函数，则自动继承父类所有的指定构造函数。  
2. 如果子类实现了父类所有的指定构造函数，则自动继承父类所有的便利构造函数。  

#其他

- 文档和注释

三条斜杠 `///` 可以生成文档注释；
使用 `MARK`, `TODO` 和 `FIXME` 可以给代码添加一些提醒，示例如下：

```swift
//MARK: - init 方法
//TODO: 有待添加一些功能
//FIXME: 有些不影响程序运行的小问题，有待以后调整
```

效果如图所示：

![效果图](http://upload-images.jianshu.io/upload_images/147260-36cd8bb0f82f36b0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


>[玩儿转Swift 2.0（第三季）](http://www.imooc.com/learn/663)