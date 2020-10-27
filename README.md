
# Design Patterns in Swift
 This repository recorded my study notes and implementations of design patterns in swift.

## Types of design patterns

<b>1 Structural Patterns</b> 
Define and manage the relationships between the objects.
Describe how objects are composed to form larger subsystems.

 - [Model-View-Controller(MVC)](documents/MVC.md) MVC pattern commonly used for developing user interfaces that divides the related program logic into three interconnected elements.
 - [Model-View-ViewModel(MVVM)](documents/MVVM.md) MVVM pattern is also referred to as model–view–binder.
 - [Model-View-Presenter(MVP)](documents/MVP.md) MVP pattern is a derivative from MVC, that you can use to deal with some of the shortcomings of MVC.
 - [View-Interactor-Presenter-Entity-Router(VIPER)](documents/VIPER.md) VIPER is a pattern similar to MVC or MVVM, but it separates the code further by single responsibility.
 - [Adapter](documents/Adapter.md) Wraps an incompatible type and exposes an interface that's familiar to the caller.
 - [Decorator](documents/Decorator.md) Enhances existing types without changing their source code.
 - [Facade](documents/Facade.md) Simplifies the usage of complex types.
 - [Flyweight](documents/Flyweight.md) Reduces memory usage by sharing comon data between objects.
 - [Proxy](documents/Proxy.md) Cloaks an object and postpones time-consuming operations until they are needed.

<b>2 Behavioral Patterns</b>
Communicating between objects.
Describe how objects exchange information with each other.

 - [Delegation](documents/Delegation.md) The delegation pattern allows an object to use a helper object to perform a task.
 - [Strategy](documents/Strategy.md) The strategy pattern defines a family of interchangeable objects that can be set or switched at runtime. 
 - [Observer](documents/Observer.md) Lets objects subscribe for notifications without being tightly coupled to the sender.
 - [Chain of Responsibility](documents/Chain_of_Responsibility.md) Decouples the sender of a request from its receivers.
 - [Iterator](documents/Iterator.md) Provides sequential access to the elements of an aggregate object.
 - [State](documents/State.md) Replaces complex conditional logic with an object-oriented state machine.
 - [Memento](documents/Memento.md) 

<b>3 Creational Patterns</b>
Instantiating objects, help to separate the usage of an object from its instantiation.

 - [Builder](documents/Builder.md) Builder pattern lets you construct complex objects step by step. 
 - [Singleton](documents/Singleton.md) Ensures that there's one instance of a type.
 - [Prototype](documents/Prototype.md) Concerned with the cloning of objects.
 - [Factory](documents/Factory.md) Creates objects without exposing its type to callers.
