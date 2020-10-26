//: [Previous](@previous)

import Foundation


/// Swift has built-in cloning support. To add cloning support to your class,
/// you need to implement the NSCopying protocol in that class and provide the
/// implementation for the `copy` method.

class BaseClass: NSCopying, Equatable {

    private var intValue = 1
    private var stringValue = "Value"

    required init(intValue: Int = 1, stringValue: String = "Value") {

        self.intValue = intValue
        self.stringValue = stringValue
    }

    /// MARK: - NSCopying
    func copy(with zone: NSZone? = nil) -> Any {
        let prototype = type(of: self).init()
        prototype.intValue = intValue
        prototype.stringValue = stringValue
        print("Values defined in BaseClass have been cloned!")
        return prototype
    }

    /// MARK: - Equatable
    static func == (lhs: BaseClass, rhs: BaseClass) -> Bool {
        return lhs.intValue == rhs.intValue && lhs.stringValue == rhs.stringValue
    }
    
}

/// Subclasses can override the base `copy` method to copy their own data into
/// the resulting object. But you should always call the base method first.
class SubClass: BaseClass {

    var boolValue = true

    func copy() -> Any {
        return copy(with: nil)
    }

    override func copy(with zone: NSZone?) -> Any {
        guard let prototype = super.copy(with: zone) as? SubClass else {
            return SubClass() // oops
        }
        prototype.boolValue = boolValue
        print("Values defined in SubClass have been cloned!")
        return prototype
    }
    
    func clone() -> SubClass {
        return self.copy() as! SubClass
    }
}

let subClass = SubClass()
subClass.boolValue = false
let subClassCopy = subClass.clone()

