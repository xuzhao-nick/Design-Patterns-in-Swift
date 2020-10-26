##  Prototype pattern

<p align="center">
  <image src="images/prototype.png"></image>
</p>



Helps us when creating multiple instances of the same type is expensive or inefficient.

Prototype pattern is used to optimize expensive instantiation time/space consuming. For example, if we need to open same file and create 100 file handlers, it need 100 times instance instantiation, which is very expensive.
By apply Prototype pattern, we copy(clone) the instance instead of constructing it from scratch.
The pattern is quite simple: the Prototype interface declares a method for cloning itself, while the Concrete Prototype implements the operation for cloning itself. 

***Challenges***

- Clone reference types doesn't come for free
- The prototype and the clones need to be independent.


## Code Example
[SampleProject]


[SampleProject]: ../samples/Prototype-pattern/ "SampleProject"


[Back]

[Back]: ../README.md "Back"
