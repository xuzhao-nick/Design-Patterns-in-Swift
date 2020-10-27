public class MulticastDelegate<T> {
    
    // MARK: - DelegateWrapper
    private class DelegateWrapper {
        
        weak var delegate: AnyObject?
        
        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }

    // MARK: - Instance Properties
    public var delegates: [T] {
        delegateWrappers = delegateWrappers.filter { $0.delegate != nil }
        return delegateWrappers.map { $0.delegate! } as! [T]
    }
    
    private var delegateWrappers: [DelegateWrapper] = []
    
    // MARK: - Object Lifecycle
    public init() {}
    
    // MARK: - Delegate Management
    public func addDelegate(_ delegate: T) {
        let wrapper = DelegateWrapper(delegate as AnyObject)
        delegateWrappers.append(wrapper)
    }
    
    public func removeDelegate(_ removeDelegate: T) {
        guard let index = delegateWrappers.firstIndex(where: {
            $0.delegate === (removeDelegate as AnyObject)
        }) else {
            return
        }
        delegateWrappers.remove(at: index)
    }
    
    public func invokeDelegates(_ closure: (T) -> ()) {
        delegates.forEach {closure($0) }
    }
}


// MARK: - Delegate Protocol
public protocol EmergencyResponding {
    func notifyFire(at location: String)
    func notifyCarCrash(at location: String)
}

// MARK: - Delegates
public class FireStation: EmergencyResponding {
    public func notifyFire(at location: String) {
        print("Fire fighters were notified about fire at " + location)
    }
    
    public func notifyCarCrash(at location: String) {
        print("Fire fighters were notified about a car crash at " + location)
    }
}

public class PoliceStation: EmergencyResponding {
    public func notifyFire(at location: String) {
        print("Police will respond to fire at " + location)
    }
    public func notifyCarCrash(at location: String) {
        print("Police will assist with car crash at " + location)
    }
}


// MARK: - Delegating Object
public class DispatchSystem {
    let multicastDelegate = MulticastDelegate<EmergencyResponding>()
}

// MARK: - Example
let dispatch = DispatchSystem()
var policeStation: PoliceStation! = PoliceStation()
var fireStation: FireStation! = FireStation()
dispatch.multicastDelegate.addDelegate(policeStation)
dispatch.multicastDelegate.addDelegate(fireStation)

dispatch.multicastDelegate.invokeDelegates{
    $0.notifyFire(at: "Ray's house")
}
print("")
dispatch.multicastDelegate.invokeDelegates{
    $0.notifyCarCrash(at: "Ray's garage!")
}












