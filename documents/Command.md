##  Command pattern

<p align="center">
  <image src="images/command.png"></image>
</p>



The command pattern is a behavioral pattern that encapsulates information to perform an action into a command object. 
It involves three types:

- The <b>invoker</b> stores and executes commands
- The <b>command</b> encapsulates the action as an object
- The <b>receiver</b> is the object that's acted upon by the command

***When should you use it?***

- Use this pattern whenever you want to create actions that can be executed on receivers at a later point in time
- For example, you can create and store commands to be performed by a computer AI, and then execute these over time

***What should you be careful about?***

- The command pattern can result in many command objects, this can lead to code that's harder to read and maintain
- If you don't need to perform actions later, you maybe better off simply calling the receiver's methods directly

## Code Example
[SampleProject]

[SampleProject]: ../samples/Command-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
