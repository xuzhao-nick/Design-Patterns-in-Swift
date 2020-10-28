##  Flyweight pattern

<p align="center">
  <image src="images/flyweight.png"></image>
</p>



The flyweight pattern is a structural design pattern that minimizes memory usage and processing.

***Features***
- The pattern provides objects that all share the same underlying data, thus saving memory. They are usually immutable to make sharing the same underlying data trivial.
- The flyweight pattern has objects, called flyweights, and a static method to return them.
- The flyweight pattern is a variation on the singleton pattern. In the flyweight pattern, you usually have multiple different objects of the same class.
- Flyweight are very common in `UIKit`. `UIColor`, `UIFont`, and `UITableViewCell` are all examples of classes with flyweights.
- For example, in Swift, `UIColor` of `red` color, `green` color, each of these colors are a single instance that share the same underlying data.

***When should you use it?***

- Use a flyweight in places where you would use a singleton, but you need multiple shared instances with different configurations.


***What should you be careful about?***
- Your flyweight shared instance must be a class and `not` a struct. Structs use copy semantics, so you don't get the benefits of shared underlying data that comes with reference types.

## Code Example
[SampleProject]

[SampleProject]: ../samples/Flyweight-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
