import Foundation

class NameClass:NSCopying {
    var firstName: String
    var lastName: String
    
    init(firstName:String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return NameClass(firstName: self.firstName, lastName: self.lastName)
    }
    
    func clone() -> NameClass {
        return self.copy() as! NameClass
    }
}

extension NameClass: CustomStringConvertible {
    public var description: String {
        return "NameClass(firstName: \"\(firstName)\", lastName:\"\(lastName)\")"
    }
}

var steve = NameClass(firstName: "Steve", lastName: "Johnson")
var john = steve
print("\(steve), \(john)")

john.firstName = "John"
john.lastName = "Wallace"
print("\(steve), \(john)")

john = steve.clone() //Clone the reference

john.firstName = "John"
john.lastName = "Wallace"
print("\(steve), \(john)")
