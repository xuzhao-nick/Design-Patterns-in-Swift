##  Iterator

<p align="center">
  <image src="images/iterator.png"></image>
</p>



The adapter pattern allows incompatible types to work together. It involves four components:

- An <b>object using an adapter</b> is the object that depends on the new protocol.

- The <b>new protocol</b> that is desired to be used.

- A <b>legacy object</b> that existed before the protocol was made and cannot be modified directly to conform to it.

- An <b>adapter</b> that's created to conform to the protocol and passes calls onto the legacy object.

In Swift, the implementation of Iterator pattern has follow features:
- The Swift <i>Iterable</i> protocol defines a type that can be iteratd using a <i>for in</i> loop.
- A <b>custom object</b> you want to make iterable, instead of comforming to <i>Iterable</i> directly,
however, you can conform to <i>Sequence</i>, which itself conforms to <i>Iterable</i>. By doing so, you'll
get many higher-order functions, including map, filter and more, implemented for free for you.


***When should you use it?***

- To make your container type iterable - so you can iterate through its objects using a <i>for in</i> loop
- Prefer adopting <i>Sequence</i> to get high-order functions for free


## Code Example
[SampleProject]

[SampleProject]: ../samples/Iterator-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
