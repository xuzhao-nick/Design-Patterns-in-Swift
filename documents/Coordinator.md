##  Coordinator pattern

<p align="center">
  <image src="images/coordinator.png"></image>
</p>



The coordinator pattern is a structural design pattern for organizing flow logic between view controllers.
It involves following components:

- The <b>coordinator</b> is a protocol that defines the methods and properties all concrete coordinators must implement. Specifically, it defines relationship properties, `children` and `router`. It also defines presentation methods, `present` and `dismiss`.
By holding onto coordinator protocols, instead of onto concrete coordinators directly, you can decouple a parent coordinator and its child coordinators. This enable a parent coordinator to hold onto various concrete child coordinators in a single property, `children`.
Likewise, by holding onto a router protocol instead of a concrete router directly, you can decouple the coordinator and its router.

- The <b>concrete coordinator</b> implements the coordinator protocol. It knows how to create concrete view controllers and the order in which view controllers should be displayed.

- The <b>router</b> is a protocol that defines methods all concrete routers must implement. Specifically, it defines `present` and `dismiss` methods for showing and dismissing view controllers.

- The <b>concrete router</b> knows how to present view controllers, but it doesn't know exactly what is being presented or which view controller will be presented next. Instead, the coordinator tells the router which view controller to present.

- The <b>concrete view controllers</b> are typical `UIViewController` subclasses found in MVC. However, they <i>don't</i> know about other view controllers, Instead, they delegate to the coordinator whenever a transition needs to performed.

This pattern can be adopted for only part of an app, or it can be used as an <b>architectural pattern</b> to define the structure of an entire app.

***When should you use it?***

- Use this pattern to decouple view controllers from one another. The only component that knows about view controllers directly is the coordinator.

- Consequently, view controllers are much more reusable: If you want to create a new flow within your app, you simply create a new coordinator.

## Code Example
[SampleProject]

[SampleProject]: ../samples/Coordinator-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
