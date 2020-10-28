##  Singleton pattern

<p align="center">
  <image src="images/singleton.png"></image>
</p>



Ensures that there's only one instance of a type.

<b>Use of Singleton</b>
- Access and manage a single resource
- UIApplication
- Log File Handler

<b>Misusing Singletons</b>
- Using the singleton as a global multipurpose container(break the single responsibility principle)
- Singletons might introduce hidden dependencies
- Problems when accessing non-thread-safe singletons concurrently
- Performance problems due to synchronization

## Code Example
[SampleProject]


[SampleProject]: ../samples/Singleton-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
