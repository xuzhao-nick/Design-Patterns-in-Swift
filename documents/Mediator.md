##  Mediator pattern

<p align="center">
  <image src="images/mediator.png"></image>
</p>



The mediator pattern is a behavioral design pattern that encapsulates how objects communicate with one another.

It involves four types:

- The <b>colleagues</b> are the objects that want to communicate with each other. They implement the colleague protocol

- The <b>colleague protocol</b> defines methods and properties that each colleague must implement 

- The <b>mediator</b> is the object that controls the communication of the colleagues. It implements the mediator protocol

- The <b>mediator protocol</b> defines methods and properties that the mediator must implement

Each colleague contains a reference to the mediator, via the mediator protocol.

In lieu of interacting with other colleagues directly, each colleague communicates through the mediator

The mediator facilitates colleague-to-colleague interaction: Colleagues may both send and receive messages from the mediator



***When should you use it?***

- This mediator pattern is useful to separate interations between colleagues into an object, the mediator
- This pattern is especially useful when you need one or more colleagues to act upon events initiated by another colleague, and in turn, have this colleague generate further events that affect other colleagues

***What should you be careful about?***

- Be careful about turning the mediator into a "god" object - an object that knows about every other object within a system
- If your mediator gets too big, consider breaking it up into multiple mediator - colleague systems
- Consider other patterns to break up the mediator, such as delegating some of its functionality

## Code Example
[SampleProject]

[SampleProject]: ../samples/Mediator-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
