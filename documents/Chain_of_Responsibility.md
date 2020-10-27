##  Chain of Responsibility

<p align="center">
  <image src="images/chain.png"></image>
</p>



The chain-of-responsibility pattern is a behavioral design pattern that allows an event to be processed by one of many handlers.
It involves three types:

- The <b>client</b> accepts and passes events to an instance of a handler protocol. Events may be simple, property-only structs or complex objects, such as intricate user actons.

- The <b>handler protocol</b> defines required properties and methods that concrete handlers must implement. This may be substituted for an abstract, base calss instead allowing for stored properties on it. Even then, it's still not meant to be insantiated directly. Rather, it onle defines requirements that concrete handlers must fulfill.

- The first <b>concrete handler</b> implements the handler protocol, and it's stored directly by the client. Upon receiving an event, it first attempts to handle it. If it's not able to do so, it passes the event on to its <b>next</b> handler.

Under the hood, each concrete handler determins whether or not to handle an event passed to it or pass it on to the next handler. This happens without the client needing to know anything about the process.
If there aren't any concrete handlers capable of handling the event, the last handler simple returns `nil`, does nothing or throws an error depending on your requirements.

***When should you use it?***

- Use this pattern whenever you have a group of related objects that handle similar events but vary based on event type, attributes or anything else related to the event
- Concrete handlers may be different classes entirely or they may be the same class type but different instances and configurations.


## Code Example
[SampleProject]

[SampleProject]: ../samples/ChainOfResponsibility-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
