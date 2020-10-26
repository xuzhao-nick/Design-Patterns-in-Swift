##  Builder

<p align="center">
  <image src="images/builder.png"></image>
</p>



The Builder pattern allows complex objects to be created step-by-step instead of all-at-once via a large initializer.
The builder pattern involves theree parts:
- The <b>Product</b> is the complex object to be created.
- The <b>Builder</b> accepts inputs step-by-step and ultimately creates the product.
- The <b>Director</b> supplies the builder with step-by-step inputs and requests the builder create the product once everything has been provided.

The pattern allows you to produce different types and representations of an object using the same construction code.

***When should you use it?***
- Works well with complex products
- Especially, requiring multiple inputs

***Different between Builder and Factory***

- Builder focuses on constructing complex objects step by step. Factory specializes in creating families of related objects. 
- Factory pattern returns the product immediately, whereas Builder lets you run some additional construction steps before fetching the product.
 
***What shuold you be careful about?***

- Maybe overkill if a product doesn't require multiple inputs over several steps.
- Instead, consider providing convenience initializers

## Code Example
[SampleProject]

[SampleProject]: ../samples/Builder-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
