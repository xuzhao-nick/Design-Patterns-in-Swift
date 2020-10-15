##  Model-View-Controller (MVC)

<p align="center">
  <image src="images/mvc.png"></image>
</p>



The Model-View-Controller (MVC) pattern separates objects into three types: models, views and controllers.

<b>Models</b> hold noto application data. They are usually structs or simple classes.

<b>Views</b> display visual elements and controls on screen. They are usually subclasses of `UIView`.

**Controllers**  coordinate between models and views. Thet are usually subclasses of `UIViewContrller`.

***MVC Key Points***

- 3 types: models, views & controllers
- Reuses models & views
- Controller coordinates between model & view
- Good starting point but has limitations

***What should you be careful about?***

- Not every object fits into model, view or controller
- Be careful about controllers growing too big!
- Use other patterns as needed

## Code Example
[Model-View-Controller.playground],[SampleProject]

[Model-View-Controller.playground]: ../samples/DesignPatternsPlayGround/Model-View-Controller.playground "Model-View-Controller.playground"

[SampleProject]: ../samples/MVC/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
