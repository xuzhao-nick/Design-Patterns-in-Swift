##  Model-View-ViewModel (MVVM)

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

## Code Example
[Model-View-ViewModel.playground],[SampleProject]

[Model-View-ViewModel.playground]: ../samples/DesignPatternsPlayGround/Model-View-ViewModel.playground "Model-View-ViewModel.playground"


[SampleProject]: ../samples/MVVM/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
