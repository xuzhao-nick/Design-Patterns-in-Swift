##  Multicast Delegate

<p align="center">
  <image src="images/multicast-delegate.png"></image>
</p>



The multicase delegate pattern is a behavioral pattern that's a variation on the delegate pattern.
It allows you to create one-to-many delegate relationships, instead of one-to-one relationships in a simple delegate.
It involves four types:

- An <b>object needing a delegate</b>, also known as the <b>delegating object</b>, is the object that <i>has</i> one or more delegates
- The <b>delegate protocol</b> defines the methods a delegate mayu or should implement
- The <b>delegate(s)</b> are objects that implement the delegate protocol
- The <b>multicase delegate</b> is a helper class that holds onto delegates and allows you to notify each whenever a delegate-worthy event happerns

***When should you use it?***

- Create one-to-many delegate relationships
- Info multiple consumers whenever a change has happens


***What should you be careful about?***
- Work best for "information only" delegate calls
- Doesn't work well if delegates need to provide data
- Instead, consider chain-of-responsibility pattern

## Code Example
[SampleProject]

[SampleProject]: ../samples/MulticastDelegate-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
