##  Memento pattern

<p align="center">
  <image src="images/memento.png"></image>
</p>



The memento pattern allows an object to be saved and restored.

It has three parts:

- The <b>originator</b> is the object to be saved or restored
- The <b>memento</b> represents a stored state
- The <b>caretaker</b> requests a save from the originator and receives a memento in response. The cretaker is responsible for persisting the memento and, later on, providing the memento back to the originator to restore the originator's state.


iOS apps typically use an `Encoder` to encode an originator's state into a memento, and a `Decoder` to decode a memento back to an originator.
This allows encoding and decoding logic to be reused across originators.
For example, `JSONEncoder` and `JSONDecoder` allow an object to be encoded into and decoded from JSON data respectively.

***When should you use it?***

- To save & restore an object
- For example, to implement a "save game" system
- By persisting an array of mementos, can implement undo/redo stacks

***What should you be careful about?***

- Be careful about removing `Codable` properties
- Don't use `try!` unless you're sure the operation will succeed
- Carefully consider versioning and model upgrades


## Code Example
[SampleProject]

[SampleProject]: ../samples/Memento-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
