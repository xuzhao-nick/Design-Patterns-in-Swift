##  State pattern

<p align="center">
  <image src="images/state.png"></image>
</p>



The state pattern is a behavioral pattern that allows an object to change its behavior at runtime. It does so by changing an internal state.
This pattern involves three types:

- The <b>context</b> is the oject whose behavior changes and has an internal state.

- The <b>state protocol</b> defines a set of methods and properties required by concrete states. If you need stored properties, you can also substitute a base state class instead of a protocol.

- The <b>concrete states</b> conform to the state protocol, or if a base class is used instead, they subclass the base. They implement required methods and properties to perform whatever behavior is desired when the context is in its state.


***When should you use it?***

- Create system with two or more states that change during lifetime
- Create both open- or closed-set states
- Use to eliminate if/else and switch statements


## Code Example
[SampleProject]

[SampleProject]: ../samples/State-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
