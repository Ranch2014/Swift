import Foundation

class Avatar {
    var name:String
    
    //required 关键字 (必须被继承的)
    required init(name:String){
        self.name = name
    }
    
    //TODO: 有待添加一些功能
    //FIXME: 有些不影响程序运行的小问题，有待以后调整
}

/// 三个斜杠就成了文档注释
///
/// 多个单行注释连在一起效果与多行注释相同
class Monster: Avatar {
    var age:Int
    
    //MARK: - init 方法
    /**
     初始化一个对象
     
     - parameter name: 名字
     - parameter age:  年龄
     - throws:
     - returns: 初始化的对象
     */
    init(name:String, age:Int){
        self.age = 12
        super.init(name: name)
    }
    
    convenience required init(name: String) {
        self.init(name:name, age:13)
    }
    
}