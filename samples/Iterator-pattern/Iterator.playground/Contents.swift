import Foundation

//A queue
public struct Queue<T> {
    private var array: [T?] = []
    private var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    public var count: Int {
        return array.count - head
    }
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    public mutating func dequeue() -> T? {
        guard head < array.count,
              let element = array[head] else {
            return nil
        }
        
        array[head] = nil
        //Resize the array
        head += 1
        let percentage = Double(head) / Double(array.count)
        if array.count > 50,
           percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        return element
    }
}


extension Queue: Sequence {
    public func makeIterator() -> IndexingIterator<Array<T>> {
        let nonEmptyValues = Array(array[head ..< array.count]) as! [T]
        return nonEmptyValues.makeIterator()
    }
    
}

public struct Ticket {
    enum PriorityType {
        case low
        case medium
        case high
    }
    var description: String
    var priority: PriorityType
}

extension Ticket {
    var sortIndex: Int {
        switch self.priority {
        case .low: return 0
        case .medium: return 1
        case .high: return 2
        }
    }
}

var queue = Queue<Ticket>()
queue.enqueue(Ticket(description: "Wireframe Tinder for dogs", priority: .low))
queue.enqueue(Ticket(description: "Set up 4k monitor", priority: .medium))
queue.enqueue(Ticket(description: "There is smoke coming out of my computer", priority: .high))
queue.enqueue(Ticket(description: "Put googly eyes on roomba", priority: .low))

print("List of Tickets in queue:")
for ticket in queue {
    print(ticket.description)
}

let sortedTickets = queue.sorted {
    $0.sortIndex > $1.sortIndex
}
print("\nSorted Tickets in queue:")
for ticket in sortedTickets {
    print(ticket.description)
}
