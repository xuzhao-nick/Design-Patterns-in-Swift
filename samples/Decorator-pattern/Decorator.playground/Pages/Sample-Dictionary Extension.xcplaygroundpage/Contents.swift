//: [Previous](@previous)

import Foundation

extension Dictionary {
    var pretty: String {
        let data = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
        return String(data: data ?? Data(), encoding: String.Encoding.utf8) ?? ""
    }
}

let dictionary: [String:Any] = [
    "embedded": [
        "JustForTheSakeOfTheDemo": 42
    ],
    "A" : "alfa",
    "B" : "bravo",
    "C" : "charlie",
    "D" : "delta",
    "E" : "echo",
    "F" : "foxtrot"
]

print(dictionary.pretty)
