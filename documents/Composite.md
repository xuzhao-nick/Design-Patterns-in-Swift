##  Composite pattern

<p align="center">
  <image src="images/composite.png"></image>
</p>



The composite pattern is a structural pattern that groups a set of objects into a tree structure so they may be manipulated as though they were one object. 

It uses three types:

- The <b>component protocol</b> ensures all constructs in the tree can bve treated the same way
- A <b>leaf</b> is a component of the tree that does not have child elements
- A <b>composite</b> is a container that can hold leaf objects and composites

Both composites and leaf nodes derive from the component protocol. You can even have several different leaf classes held in a composite object.

***When should you use it?***

- If your app's class hierarchy forms a branching pattern

***What should you be careful about?***

- Make sure your app has a branching structure before using the composite pattern, not all situations involving protocols will require a composite object

## Code Example
[SampleProject]

[SampleProject]: ../samples/Composite-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
