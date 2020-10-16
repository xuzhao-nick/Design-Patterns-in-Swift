##  Model-View-Presenter (MVP)

<p align="center">
  <image src="images/mvp.png"></image>
</p>



The Model-View-Presenter (MVP) pattern separates objects into three types: models, views and presenters.

<b>Models</b> hold noto application data. They are usually structs or simple classes.

<b>Views</b> display visual elements and controls on screen. They are usually subclasses of `UIView`.

<b>Presenters</b>  is the "middle-man" between Model and View. It reacts to the user’s actions performed on the View, retrieves data from the Model, and formats it for display in the View

***Differences between MVC and MVP***

- View in MVC is tightly coupled with the Controller, the View part of the MVP consists of both UIViews and UIViewController
- MVP View is as dumb as possible and contains almost no logic (like in MVVM), MVC View has some business logic and can query the Model
- MVP View handles user gestures and delegates interaction to the Presenter, in MVC the Controller handles gestures and commands Model
- MVP pattern highly supports Unit Testing, MVC has limited support
- MVC Controller has lots of UIKit dependencies, MVP Presenter has none

***When should you use it?***
- Our screen has bi-directional-flow, it means that user interactions need to request something from our Model, and the result of this request will affect the View.

- The View affected by the updates from Model are very limited.

- MVP pattern is not used in a case when the UI is updated without user interactions, like updating UI when an event happens in the Model, this approach is closer to MVVM more than MVP.

***Benefits***
- The View does not interact directly with the Model. This isolates the View implementation bettern than in MVC and allows easier automated unit testing of the Presenter and Model.

- The ability to change the UI from Web to Window or Mobile is very easy.

- Low maintain cost

***Drawbacks***
- The Presenter tends to expand to a huge all-knowing class if we are not careful enough and do not break our code according to Single Responsibility Principle.

- Increased complexity.

- Extra learning curve.

## Code Example
[SampleProject]

[SampleProject]: ../samples/MVP-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
