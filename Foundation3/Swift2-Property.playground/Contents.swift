//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//属性和方法

//计算属性
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
    //计算属性 (依赖其他属性而存在的属性)
//    var center:Point { //必须为 var 类型，且显式声明类型
//        let centerX = origin.x + size.width/2
//        let centerY = origin.y + size.height/2
//        return Point(x: centerX, y: centerY)
//    }
    
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
    
//    var area:Double{
//        return size.width * size.height
//    }
    
    //也可以显式声明只有 getter
    var area:Double{
        get{
            return size.width * size.height
        }
    }
    
    init(origin:Point, size:Size){
        self.origin = origin
        self.size = size
    }
}

var rectangle = Rectangle(origin: Point(), size: Size(width: 10, height: 5))
rectangle.center

//rectangle.center = Point() //不能这样直接赋值
rectangle.center = Point(x: 10, y: 10)

//类型属性 (Type property)
class Player {
    var name:String
    var score = 0 //个人总分
    static var highestScore = 0 //所有玩家最高分,类的属性 (static 关键字)
    
    init(name:String){
        self.name = name
    }
    
    func play() {
        let score = random()%100
        print("\(name) played and got \(score).")
        
        self.score += score
        print("Total score is \(self.score)")
        
        if self.score > Player.highestScore {
            Player.highestScore = self.score
        }
        print("Highest score is \(Player.highestScore).")
    }
}

let player1 = Player(name: "player1")
let player2 = Player(name: "player2")

//player1.play()
//player1.play()
//player1.play()

//player2.play()

//类型方法 (Type Method)
class Matrix {
    var m:[[Int]] //二维数组
    var row:Int
    var col:Int
    
    init?(_ arr2d:[[Int]]){
        guard arr2d.count > 0 else {
            return nil
        }
        
        let row = arr2d.count
        let col = arr2d[0].count
        for i in 1..<row { //保证二维数组为矩阵
            if arr2d[i].count != col {
                return nil
            }
        }
        
        self.m = arr2d
        self.row = row
        self.col = col
    }
    
    //打印出该矩阵
    func printMatrix() {
        for i in 0..<row {
            for j in 0..<col {
                print(m[i][j], terminator:"\t")
            }
            print()
        }
    }
    
    //生成单位矩阵的类方法
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

if let m = Matrix([[1, 2], [3, 4]]) {
//    m.printMatrix()
}

if let e = Matrix.identityMatrix(3) {
    e.printMatrix()
}

//属性观察器(Property Observer)
//注意：willSet 和 didSet 不会在初始化阶段(init)调用
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

let bulb = LightBulb()
bulb.current = 20
//bulb.current = 30
bulb.current = 32

//Lazy Property 延迟加载
class Book {
    let name:String
    //延迟加载 (lazy 关键字，加载一次后保存下来，避免每次都加载)
    lazy var content:String? = {
        return nil
    }()
    
    init(name:String){
        self.name = name
    }
}

//访问控制
//public: 可以被模块外访问。
//internal: 可以被本模块访问。
//private: 可以被本文件访问。

//便利的构造函数
//便利的构造函数并没有把对象构造出来，而是执行了一些逻辑后，把构造交给了其他构造函数。

//构造函数的继承
//如果子类实现了父类所有的指定构造函数，则自动继承父类的所有的便利构造函数
//若子类没有实现任何父类的指定构造函数，则自动继承父类的指定构造函数

//required 关键字
//必须被继承，







