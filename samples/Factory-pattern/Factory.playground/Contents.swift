protocol Serializable {
    func serialize()
}

class JSONSerializer: Serializable {
    func serialize() {
        print("JSON Serializer \(#function)")
    }
}

class PropertyListSerializer: Serializable {
    func serialize() {
        print("Property Serializer \(#function)")
    }
}

class XMLSerializer: Serializable {
    func serialize() {
        print("XML Serializer \(#function)")
    }
}

enum Serializers {
    case json
    case plist
    case xml
}
//Factory Method
func makeSerializer(_ type: Serializers) -> Serializable? {
    let result: Serializable?
    switch type {
    case .json: result = JSONSerializer()
    case .plist: result = PropertyListSerializer()
    case .xml: result = XMLSerializer()
    }
    return result
}

let jsonSerializer = makeSerializer(.json)
jsonSerializer?.serialize()

let xmlSerializer = makeSerializer(.xml)
xmlSerializer?.serialize()

//Factory Class
struct SerializerFactory {
    static func makeSerializer(_ type: Serializers) -> Serializable? {
        let result: Serializable?
        switch type {
        case .json: result = JSONSerializer()
        case .plist: result = PropertyListSerializer()
        case .xml: result = XMLSerializer()
        }
        return result
    }

}

let plistSerializer = SerializerFactory.makeSerializer(.plist)
plistSerializer?.serialize()

