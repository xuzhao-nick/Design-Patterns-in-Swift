##  Delegation

<p align="center">
  <image src="images/delegation.png"></image>
</p>



The delegation pattern allows an object to use a helper object to perform a task, instead of doing the task itself.

This allows for code reuse through object composition, instead of inheritance.

***When should you use it?***

- Break up large classes or create reusable components
- `Datasources` and `delegates` both use this pattern
- `Datasources` provide data
- `Delegates` receive data

***What should you be careful about?***

- Creating too many delegates
- Consider breaking up classes based on functionality instead

## Code Example
[SampleProject]

[SampleProject]: ../samples/Delegation-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
