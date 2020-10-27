import Combine

public class User {
    
    @Published var name: String
    
    public init(name: String) {
        self.name = name
    }
}


let user = User(name: "Ray")

let publisher = user.$name

var subscriber: AnyCancellable? = publisher.sink() {
    print("User's name is \($0)")
}

user.name = "Vicki"


subscriber = nil
user.name = "Ray has left the building"
