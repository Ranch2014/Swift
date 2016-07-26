import Foundation

public class Hero {
    var name:String
    var life:Int = 100
    
    var description:String{
        return "I'm \(name)."
    }
    
    //若前面使用 final 关键字，则该方法不能被重写
    func beAttacked(attack:Int) {
        life -= 10
    }
    
    public init(name:String){
        self.name = name
    }
}

//添加 final 关键字的类不可被继承
final class Guldan: Hero {
    //属性重载 (override 关键字)
    override var description: String{
        return "Your soul belongs to me!"
    }
    
    override init(name: String) { //构造方法重载
        self.group = ""
        print("my name is \(name)")
        super.init(name: name)
    }
    
    var group:String
    init(name:String, group:String){
        //两段式构造：构造
        self.group = group
        super.init(name: name) //注意：先初始化子类的属性，才能调用初始化父类
        
        //super 后初始化才完成，才能使用 self(初值除外)，但可以使用其他逻辑
        if group == "" {
            //do something
        }
    }
    
    //convenience 关键字，构造函数中调用了另一个构造函数 (方便的构造函数，其他构造函数称为指定构造函数)
    convenience init(firstName:String, lastName:String){
        self.init(name:firstName + " " + lastName) //调用指定初始化函数
    }
    
    //方法重载
    override func beAttacked(attack: Int) {
        life -= 15
    }
}

let hero = Hero(name: "Medivh")

        