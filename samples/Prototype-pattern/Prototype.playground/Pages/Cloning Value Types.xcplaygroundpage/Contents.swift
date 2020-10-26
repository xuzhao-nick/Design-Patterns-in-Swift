//Cloning value type is easy
struct NameStruct {
    var firstName: String
    var lastName: String
}

var joe = NameStruct(firstName: "Joe", lastName: "Satri")
var patrick = joe //Clone

print("\(joe), \(patrick)")

patrick.firstName = "Patrick"
patrick.lastName = "McKenna"

print("\(joe), \(patrick)")




