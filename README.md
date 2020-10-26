
# Design Patterns in Swift
 This repository recorded my study notes and implementations of design patterns in swift.

## Types of design patterns

<b>1 Structural Patterns</b> 
Define and manage the relationships between the objects.
Describe how objects are composed to form larger subsystems.

 - [Model-View-Controller(MVC)](documents/MVC.md)
 - [Model-View-ViewModel(MVVM)](documents/MVVM.md)
 - [Model-View-Presenter(MVP)](documents/MVP.md)
 - [View-Interactor-Presenter-Entity-Router(VIPER)](documents/VIPER.md)
 - [Adapter](documents/Adapter.md) Wraps an incompatible type and exposes an interface that's familiar to the caller.
 - [Decorator](documents/Decorator.md) Enhances existing types without changing their source code.
 - [Facade](documents/Facade.md) Simplifies the usage of complex types.
 - [Flyweight](documents/Flyweight.md) Reduces memory usage by sharing comon data between objects.
 - [Proxy](documents/Proxy.md) Cloaks an object and postpones time-consuming operations until they are needed.

<b>2 Behavioral Patterns</b>
Communicating between objects.
Describe how objects exchange information with each other.

 - [Chain of Responsibility](documents/Chain_of_Responsibility.md) Decouples the sender of a request from its receivers.
 - [Iterator](documents/Iterator.md) Provides sequential access to the elements of an aggregate object.
 - [Observer](documents/Observer.md) Lets objects subscribe for notifications without being tightly coupled to the sender.
 - [State](documents/State.md) Replaces complex conditional logic with an object-oriented state machine.
 - Delegation 
 - Stategy

<b>3 Creational Patterns</b>
Instantiating objects, help to separate the usage of an object from its instantiation.

 - Builder
 - [Singleton](documents/Singleton.md) Ensures that there's one instance of a type.
 - [Prototype](documents/Prototype.md) Concerned with the cloning of objects.
 - [Factory Method](documents/Factory.md) Creates objects without exposing its type to callers.
