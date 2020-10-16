##  Model-View-Presenter (MVP)

<p align="center">
  <image src="images/mvvm.png"></image>
</p>



The Model-View-ViewModel (MVVM) pattern separates objects into three types: models, views and view-models.

<b>Models</b> hold noto application data. They are usually structs or simple classes.

<b>View-models</b>  convert models into a format that views can use.

<b>Views</b> display visual elements and controls on screen. They are usually subclasses of `UIView`.

***When should you use it?***

- Transforming models into view representation
- Compliments MVC well by moving transformation logic out of view controllers

***What should you be careful about?***

- Objects won't always fit into models, view-models or views categories
- Use with other Patterns
- May be overkill initially when creating an app

***MVVM Key Points***

- Slims down view Controllers
- View models take models and transform them to be displayable
- Okay to start with MVC and convert to MVVM later on

## Code Example
[Model-View-ViewModel.playground],[SampleProject]

[Model-View-ViewModel.playground]: ../samples/DesignPatternsPlayGround/Model-View-ViewModel.playground "Model-View-ViewModel.playground"


[SampleProject]: ../samples/MVVM-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
