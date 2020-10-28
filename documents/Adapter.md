##  Adapter pattern

<p align="center">
  <image src="images/adapter.png"></image>
</p>



The adapter pattern allows imcompatiblel types to work together. It involves four components:

- An <b>object using an adapter</b> is the object that depends on the new protocol.

- The <b>new protocol</b> that is desired to be used.

- A <b>legacy object</b> that existed before the protocol was made and cannot be modified directly to conform to it.

- An <b>adapter</b> that's created to conform to the protocol and passes calls onto the legacy object.

***When should you use it?***

- When you can't modify a class, module or function
- Create adapter using an extension or a new adapter class

***What should you be careful about?***

- Protocols are a requirement
- Overkill unless there's a possibility for change

## Code Example
[SampleProject]

[SampleProject]: ../samples/Adapter-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
