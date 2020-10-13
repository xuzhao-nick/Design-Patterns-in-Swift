##  Model-View-Controller (MVC)

<p align="center">
  <image src="images/mvc.png"></image>
</p>



The model-view-controller (MVC) pattern separates objects into three types: models, views and controllers.

<b>Models</b> hold noto application data. They are usually structs or simple classes.

<b>Views</b> display visual elements and controls on screen. They are usually subclasses of `UIView`.

**Controllers**  coordinate between models and views. Thet are usually subclasses of `UIViewContrller`,

## Code Example



***What should you be careful about?***

- Not every object fits into model, view or controller
- Be careful about controllers growing too big!
- Use other patterns as needed



