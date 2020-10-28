##  Decorator pattern

<p align="center">
  <image src="images/decorator.png"></image>
</p>



The decorator pattern enhances existing types without changing their source code.

***Features***

- Flexible alternative to subclassing
- Implemented as an object wrapper
- Same interface as the wrapped type
- Adds new features via recursive decorator composition

***Decorator through Swift Extension***

- Original type's implementation unaffected
- No object wrapper required


***What should you be careful about?***

- Avoid adding unrelated behavior to a type(do not violate the Single Responsibility Principle!)


## Code Example
[SampleProject]

[SampleProject]: ../samples/Decorator-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
