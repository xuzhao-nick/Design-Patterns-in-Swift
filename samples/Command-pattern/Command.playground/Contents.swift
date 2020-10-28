import Foundation

// MARK: - Receiver
public class Door {
    public var isOpen = false
}

// MARK: - Command
public class DoorCommand {
    public let door: Door
    public init(_ door: Door) {
        self.door = door
    }
    public func execute() {}
}

public class OpenCommand: DoorCommand {
    public override func execute() {
        print("opening the door,,,")
        door.isOpen = true
    }
}

public class CloseCommand: DoorCommand {
    public override func execute() {
        print("closing the door...")
        door.isOpen = false
    }
}

// MARK: - Invoker
public class Doorman {
    public let commands: [DoorCommand]
    public let door: Door
    
    public init(door: Door) {
        let commandCount = arc4random_uniform(10) + 1
        self.commands = (0 ..< commandCount).map { index in
            return index % 2 == 0 ?
            OpenCommand(door) : CloseCommand(door)
        }
        self.door = door
    }
    
    public func execute() {
        print("Doorman is...")
        commands.forEach{ $0.execute() }
    }
}


// MARK: - Example
public let isOpen = false
print("You predict the door will be " +
    "\(isOpen ? "open" : "closed").")
print("")
let door = Door()
let doorman = Doorman(door: door)
doorman.execute()
print("")
if door.isOpen == isOpen {
  print("You were right! :]")
} else {
  print("You were wrong :[")
}
print("The door is \(door.isOpen ? "open" : "closed").")
