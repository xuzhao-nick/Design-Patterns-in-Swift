##  Iterator

<p align="center">
  <image src="images/iterator.png"></image>
</p>



The adapter pattern allows imcompatiblel types to work together. It involves four components:

- An <b>object using an adapter</b> is the object that depends on the new protocol.

- The <b>new protocol</b> that is desired to be used.

- A <b>legacy object</b> that existed before the protocol was made and cannot be modified directly to conform to it.

- An <b>adapter</b> that's created to conform to the protocol and passes calls onto the legacy object.

***When should you use it?***

- To make your container type iterable - so you can iterate through its objects using a <i>for in</i> loop
- Prefer adopting <i>Sequence</i> to get high-order functions for free


## Code Example
[SampleProject]

[SampleProject]: ../samples/Iterator-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
