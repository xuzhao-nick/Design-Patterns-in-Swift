##  Facade pattern

<p align="center">
  <image src="images/facade.png"></image>
</p>



The facade pattern is a structural pattern that provides a simple interface to a complex system.
It involves two types:

- The <b>facade</b> provides simple methods to interact with the system. This allows consumers to use the facade instead of knowing about and interacting with multiple classes in the system.

- The <b>dependencies</b> are objects owned by the facade. Each dependency performs a small part of a complex task.

***When should you use it?***

- Use whenever you have a system of components that each perform a small part of a larger task, for example, a product ordering system with multiple pieces: customer management, inventory, shipping,etc.

***What should you be careful about?***

- Be careful about creating a "god" facade that knows every class in your app
- Okay to create more than one facade for different use cases

## Code Example
[SampleProject]

[SampleProject]: ../samples/Facade-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
