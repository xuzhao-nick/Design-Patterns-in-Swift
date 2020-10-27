##  Strategy

<p align="center">
  <image src="images/strategy.png"></image>
</p>



The strategy pattern defines a family of interchangeable objects.

This pattern makes apps more flexible and adaptable to changes at runtime, instead of requiring compile-time changes.

The pattern has three parts:

- The <b>Object using a strategy</b>. This is most often a view controller when the pattern is used in iOS app development, but it can technically be any kind of object that needs interchangeable behavior.
- The <b>strategy protocol</b> defines methods that every strategy must implement.
- The <b>strategies</b> are objects that conform to the strategy protocol.

***When should you use it?***

- Two or more interchangeable behaviours
- Family of objects, instead of one
- Easily changeable at runtime

***What should you be careful about?***

- Pre-optimising and overusing this pattern
- If behavior won't change, okay to code it in a controller/object

## Code Example
[SampleProject]

[SampleProject]: ../samples/Strategy-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
