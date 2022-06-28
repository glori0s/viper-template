# VIPER

## 1. What is VIPER?

Viper is a design pattern, the name of which is a backronym for _View_, _Interactor_, _Presenter_, _Entity_ and _Router_. It helps to develop an app with more modular structure that would be consistent to Single Responsibility Principle. 

The main idea is to split an app's logical structure into distinct layers of responsibility, what should make it easier to isolate dependencies and test the interactions between layers. This can be achieved by using the following structure:

![Viper](https://github.com/glori0s/viper-template/blob/main/Attachments/Images/Viper.png?raw=false)

The diagram above illustrates the VIPER architecture, in which each block corresponds to an object with specific tasks, inputs and outputs. The connections between the blocks represent the relationship between the objects, and what kind of information they transmit to each other:

- _View(Controller)_: displays what it is told to by the _Presenter_ and relays user input back to the _Presenter_. Contains only UI logic.
- _Presenter_: reacts to user inputs, requests data from _Interactor_ and prepares it for displaying.
- _Interactor_: acts like facade for the business logic as specified by a use case.
- _Router_: creates the module and contains navigation logic.


## 2. My own implementation differences.

When I was looking for VIPER tutorials, there were two implementation types:

- First, with declaration of delegates in protocols: 

    ````
    protocol ViewProtocol {
        var presenter: PresenterProtocol? { get set }
        
        func reloadSomeViews()
    }

    protocol PresenterProtocol {
        var view: ViewProtocol? { get set }
        var interactor: InteractorProtocol? { get set }
        var router: RouterProtocol? { get set }
        
        func someButtonTapped()
    }

    protocol InteractorProtocol {
        var presenter: PresenterProtocol? { get set }
        
        func doSomething()
    }
    ````
    
    Where it can easily ends up with something like this
    
    ````
    class ViewController: UIViewController, ViewProtocol {
        ...
        func someButtonTapped() {
            presenter?.interactor?.doSomething()
        }
        ...
    }
    ````
    
    when you get direct access to the _Interactor_'s methods and might wonder where the encapsulation has gone;
    
- And second, where is no declaration of required delegates.

    ````
    protocol ViewProtocol {
        func reloadSomeViews()
    }

    protocol PresenterProtocol {
        func someButtonTapped()
    }

    protocol InteractorProtocol {
        func doSomething()
    }
    ````
    
To declare them and do not break encapsulation, I have decided to split requirements into two parts. The first part is four generic protocols in __Basic__ template, each of those describes required delegates for _View_, _Presenter_, _Interactor_ and _Router_ respectively:

````
protocol Viewable: AnyObject {
    associatedtype Presenter
    
    var presenter: Presenter? { get set }
}
````

````
protocol Presentable: AnyObject {
    associatedtype View
    associatedtype Interactor
    associatedtype Router
    
    var view: View? { get set }
    var interactor: Interactor? { get set }
    var router: Router? { get set }
}
````

````
protocol Interactable: AnyObject {
    associatedtype Presenter
    
    var presenter: Presenter? { get set }
}
````

````
protocol Routable: AnyObject {

    associatedtype View: UIViewController & Viewable
    associatedtype Presenter: Presentable
    associatedtype Interactor: Interactable
    associatedtype Router: Routable
    
    var view: View? { get set }
    
    static func createModule(view: View, presenter: Presenter, interactor: Interactor, router: Router) -> View
}
````

The second part is delegate protocols for the module's components in __Module__ template, which will be filled with the necessary methods:

- For _View_

    ````
    protocol *ViperModuleName*PresenterToView: AnyObject {}
    ````

- For _Presenter_

    ````
    protocol *ViperModuleName*ViewToPresenter: AnyObject {}
    protocol *ViperModuleName*InteractorToPresenter: AnyObject {}
    ````
    
- For _Interactor_

    ````
    protocol *ViperModuleName*PresenterToInteractor: AnyObject {}
    ````
    
- For Router

    ````
    protocol *ViperModuleName*PresenterToRouter: AnyObject {}
    ````

I have decided not to call them abstractly as _'ViewProtocol'_, _'PresenterProtocol'_, etc., but give them concrete names those will indicate which component calls whose component's delegate. So the _Presenter_ has two protocols, one from the _View_ and one from the _Interactor_.

## 3. Final implementation

### 3.1 _View_

Module's _View_ is a UIViewController whose only responsibility is to display what the _Presenter_ tells to and handle user interactions. _View_ sends events triggered by the user to _Presenter_ and awaits to further instructions. 

````
protocol *ViperModuleName*PresenterToView: AnyObject {}

final class *ViperModuleName*View: UIViewController, Viewable {

    typealias Presenter = *ViperModuleName*ViewToPresenter

    var presenter: Presenter?
}

extension *ViperModuleName*View: *ViperModuleName*PresenterToView {}
````

### 3.2 _Presenter_

Module's _Presenter_ connects the _View_ and the other parts of a module. It receives input events from _View_ and passes them on to the _Interactor_ or to the _Router_. It also obtains data received from the _Interactor_ to tell the _View_ to display it.

````
protocol *ViperModuleName*ViewToPresenter: AnyObject {}
protocol *ViperModuleName*InteractorToPresenter: AnyObject {}

final class *ViperModuleName*Presenter: Presentable {

    typealias View = *ViperModuleName*PresenterToView
    typealias Interactor = *ViperModuleName*PresenterToInteractor
    typealias Router = *ViperModuleName*PresenterToRouter
    
    weak var view: View?
    var interactor: Interactor?
    var router: Router?
}

extension *ViperModuleName*Presenter: *ViperModuleName*ViewToPresenter {}
extension *ViperModuleName*Presenter: *ViperModuleName*InteractorToPresenter {}
````

### 3.3 _Interactor_

The _Interactor_ contains all the business logic related to the entities and should be completely independent of the user interface.

````
protocol *ViperModuleName*PresenterToInteractor: Anyobject {}

final class *ViperModuleName*Interactor: Interactable {

    typealias Presenter = *ViperModuleName*InteractorToPresenter
    
    weak var presenter: Presenter?
}

extension *ViperModuleName*Interactor: *ViperModuleName*PresenterToInteractor {}
````

### 3.4 _Entity_

The _Entity_ is usually a payload among the other components. It simply encapsulates data and in some modules this component may not be ever presented. For example:

````
struct SomeEntity {
    var firstAttribute: String
    var secondAttribute: Int
    var thirdAttribute: Double
}
````

### 3.5 _Router_

The last element of VIPER architecture which is responsible for creating the module, navigating and passing data between modules. It receives instructions what screen it should route for from the _Presenter_. It should also contain a reference to the module's _View_ as only UIViewController can perform a transition between screens.

````
protocol *ViperModuleName*PresenterToRouter: AnyObject {}

final class *ViperModuleName*Router: Routable {

    typealias View = *ViperModuleName*View
    typealias Presenter = *ViperModuleName*Presenter
    typealias Interactor = *ViperModuleName*Interactor
    typealias Router = *ViperModuleName*Router
    
    weak var view: View?
    
    static func createModule(view: View, presenter: Presenter, interactor: Interactor, router: Router) -> View {
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}

extension *ViperModuleName*Router: *ViperModuleName*PresenterToRouter {}
````
