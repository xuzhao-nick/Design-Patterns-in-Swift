import UIKit

let red = UIColor.red
let red2 = UIColor.red
//Use === operator shows that each variable has the same memory address, whiche means `.red` is only instantiated once.
print(red === red2)

//Following UIColor objects are not follow flyweight pattern
let color = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
let color2 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
print(color === color2)

//You can extend UIColor, to make your own color initial method which follow flyweight pattern

extension UIColor {
    public static var colorStore: [String: UIColor] = [:]
    
    public class func rgba(_ red: CGFloat,
                           _ green: CGFloat,
                           _ blue: CGFloat,
                           _ alpha: CGFloat) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alpha)"
        
        if let color = colorStore[key] {
            return color
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        colorStore[key] = color
        return color
    }
}


let flyColor = UIColor.rgba(1, 0, 0, 1)
let flyColor2 = UIColor.rgba(1, 0, 0, 1)
print(flyColor === flyColor2)

