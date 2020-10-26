##  View-Interactor-Presenter-Entity-Router(VIPER)

<p align="center">
  <image src="images/viper.png"></image>
</p>



The VIPER pattern is a Clean Architecture that conforms to the Single Responsibility Principle. VIPER strives to divide the app’s logic into distinct layers of responsibility. Going a couple steps further than MVC, VIPER is broken down into five responsibilities:

<b>View</b> Displays information from the Presenter and sends user interactions back to the Presenter.

<b>Interactor</b> Retrieves Entities and contains the business logic for a particular use case. They are view agnostic and can be consumed by one or many Presenters.

<b>Presenter</b> Handles preparing content for the display and intercepting user interactions.

<b>Entity</b> Simple data model objects.

<b>Router</b> Handles navigation logic for which screens should appear and when.

The basic flow of VIPER is fairly straightforward. The user is brought to a new View by the Router, the View notifies the Presenter that it needs data, the Presenter asks the Interactor for data, the Interactor retrieves the Entities (from network request or local database), the Interactor sends the Entities to the Presenter, the Presenter creates View Models from the Entities, the Presenter sends the View Models to the View, and the View displays the necessary data to the user.

***The Benefits of VIPER***

- <b>Ease of testing:</b> Due to the loosely coupled nature of the VIPER pattern, adding unit tests to every object is simple compared to other patterns.
- <b>Handles large teams:</b> The project that I used VIPER on had roughly 15 developers. Because of the separation of modules within the pattern, developers can easily work on different parts of the app without stepping on each other’s toes. Using VIPER also helps to reduce merge conflicts.
- <b>Ease of development:</b> Once the project is fully set up on VIPER, it becomes easier to add a new feature to a module. If you need a new way to sort something, you can add a new method in the Presenter. Developers can couple the VIPER pattern with Dependency Injection to add new features quickly and easily.

***The Negatives of VIPER***

- <b>High learning curve:</b> Due to the increase complexity of VIPER over MVC, the team might need more discussion and training on to properly implement the pattern across their application.

- <b>Extra work is required</b>When using VIPER with existing code or new frameworks, extra work is required to ensure code compatibility.



## Code Example
[SampleProject]

[SampleProject]: ../samples/VIPER-pattern/ "SampleProject"






[Back]

[Back]: ../README.md "Back"
