import PlaygroundSupport
import UIKit

// MARK: - HomeViewController
public class HomeViewController: UIViewController {
  
  // MARK: - Views
  public var onButtonPressed: (() -> Void)?
  
  private var button: UIButton!
  private var label: UILabel!
  
  // MARK: - View Lifecycle
  public override func loadView() {
    setupView()
    setupButton()
  }
  
  private func setupView() {
    view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
    view.backgroundColor = .white
  }
  
  private func setupButton() {
    button = UIButton()
    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    button.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
    button.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    
    button.setTitle("How to Code", for: .normal)
    button.backgroundColor = .black
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
  }
  
  @objc private func buttonPressed(_ sender: AnyObject) {
    onButtonPressed?()
  }
}

// MARK: - Constructors
extension HomeViewController {
  
  public class func instantiate() -> HomeViewController {
    let viewController = HomeViewController()
    viewController.title = "Code"
    return viewController
  }
}



// MARK: - StartOverViewControllerDelegate
public protocol StartOverViewControllerDelegate: class {
  func startOverViewControllerDidPressStartOver(_ controller: StartOverViewController)
}

// MARK: - StartOverViewController
public class StartOverViewController: UIViewController {
  
  // MARK: - Instance Properties
  public var delegate: StartOverViewControllerDelegate?
  
  // MARK: - Views
  private var button: UIButton!
  private var label: UILabel!
  
  // MARK: - View Lifecycle
  public override func loadView() {
    setupView()
    setupButton()
  }
  
  private func setupView() {
    view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
    view.backgroundColor = .white
  }
  
  private func setupButton() {
    button = UIButton()
    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    button.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    
    button.setTitle("START OVER", for: .normal)
    button.backgroundColor = .black
    button.addTarget(self, action: #selector(startButtonPressed(_:)), for: .touchUpInside)
  }
  
  @objc private func startButtonPressed(_ sender: AnyObject) {
    delegate?.startOverViewControllerDidPressStartOver(self)
  }
}

// MARK: - Constructors
extension StartOverViewController {
  
  public class func instantiate(delegate: StartOverViewControllerDelegate?) -> StartOverViewController {
    let viewController = StartOverViewController()
    viewController.delegate = delegate
    viewController.title = "Start Over?"
    return viewController
  }
}



// MARK: - StepViewControllerDelegate
public protocol StepViewControllerDelegate: class {
  func stepViewControllerDidPressNext(_ controller: StepViewController)
}

// MARK: - StepViewController
public class StepViewController: UIViewController {
  
  // MARK: - Instance Properties
  public var delegate: StepViewControllerDelegate?
  
  private var buttonColor: UIColor!
  private var text: String!
  
  // MARK: - Views
  private var button: UIButton!
  private var label: UILabel!
  
  // MARK: - View Lifecycle
  public override func loadView() {
    setupView()
    setupButton()
  }
  
  private func setupView() {
    view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
    view.backgroundColor = .white
  }
  
  private func setupButton() {
    button = UIButton()
    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    button.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
    button.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    
    button.setTitle(text, for: .normal)
    button.titleLabel?.numberOfLines = 0
    button.titleLabel?.lineBreakMode = .byWordWrapping
    button.backgroundColor = buttonColor
    button.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
  }
  
  @objc private func nextButtonPressed(_ sender: AnyObject) {
    delegate?.stepViewControllerDidPressNext(self)
  }
}

// MARK: - Constructors
extension StepViewController {
  
  public class func instantiate(delegate: StepViewControllerDelegate?,
                                buttonColor: UIColor,
                                text: String,
                                title: String) -> StepViewController {
    let viewController = StepViewController()
    viewController.delegate = delegate
    viewController.buttonColor = buttonColor
    viewController.text = text
    viewController.title = title
    return viewController
  }
}


public protocol Coordinator: class {
    var children: [Coordinator] { get set }
    var router: Router { get }
    
    func present(animated: Bool, onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
    func presentChild(_ child: Coordinator,
                      animated: Bool,
                      onDismissed: (() -> Void)?)
}


public protocol Router: class {
    func present(_ viewController: UIViewController, animated: Bool)
    
    func present(_ viewController: UIViewController,
                 animated: Bool,
                 onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
}

extension Router {
    public func present(_ viewController: UIViewController,
                        animated: Bool) {
        present(viewController, animated: animated,
                onDismissed: nil)
    }
}

public class NavigationRouter: NSObject, UINavigationControllerDelegate {
    private let navigationController: UINavigationController
    private let routerRootController: UIViewController?
    private var onDismissForViewController:
        [UIViewController : (() -> Void)] = [:]
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.routerRootController = navigationController.viewControllers.first
        super.init()
        navigationController.delegate = self
    }
}

// MARK: - Router
extension NavigationRouter: Router {
    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismissed
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func dismiss(animated: Bool) {
        guard let routerRootController = routerRootController else {
            navigationController.popToRootViewController(animated: animated)
            return
        }
        performOnDismissed(for: routerRootController)
        navigationController.popToViewController(routerRootController, animated: animated)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else {
            return
        }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

extension Coordinator {
    
    public func dismiss(animated: Bool) {
        router.dismiss(animated: true)
    }
    
    public func presentChild(_ child: Coordinator,
                             animated: Bool,
                             onDismissed: (() -> Void)? = nil) {
        children.append(child)
        child.present(animated: animated, onDismissed: {
            [weak self, weak child] in
            guard let self = self,
                let child = child else {
                    return
        }
        self.removeChild(child)
        onDismissed?()
        })
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child}) else {
            return
        }
        children.remove(at: index)
    }
}

public class HowToCodeCoordinator: Coordinator {
    // MARK: - Instance Properties
    public var children: [Coordinator] = []
    public let router: Router
    
    private lazy var stepViewControllers = [
        StepViewController.instantiate(
          delegate: self,
          buttonColor: UIColor(red: 0.96, green: 0, blue: 0.11,
                               alpha: 1),
          text: "When I wake up, well, I'm sure I'm gonna be\n\n" +
          "I'm gonna be the one writin' code for you",
          title: "I wake up"),

        StepViewController.instantiate(
          delegate: self,
          buttonColor: UIColor(red: 0.93, green: 0.51, blue: 0.07,
                               alpha: 1),
          text: "When I go out, well, I'm sure I'm gonna be\n\n" +
          "I'm gonna be the one thinkin' bout code for you",
          title: "I go out"),

        StepViewController.instantiate(
          delegate: self,
          buttonColor: UIColor(red: 0.23, green: 0.72, blue: 0.11,
                               alpha: 1),
          text: "Cause' I would code five hundred lines\n\n" +
          "And I would code five hundred more",
          title: "500 lines"),

        StepViewController.instantiate(
          delegate: self,
          buttonColor: UIColor(red: 0.18, green: 0.29, blue: 0.80,
                               alpha: 1),
          text: "To be the one that wrote a thousand lines\n\n" +
          "To get this code shipped out the door!",
          title: "Ship it!")
      ]
    
    private lazy var startOverViewController = StartOverViewController.instantiate(delegate: self)
    
    // MARK: - Object Lifecycle
    public init(router: Router) {
        self.router = router
    }
    
    // MARK - Coordinator
    public func present(animated: Bool,
                        onDismissed: (() -> Void)?) {
      let viewController = stepViewControllers.first!
      router.present(viewController,
                     animated: animated,
                     onDismissed: onDismissed)
    }

}

// MARK: - StepViewControllerDelegate
extension HowToCodeCoordinator: StepViewControllerDelegate {
  
  public func stepViewControllerDidPressNext(
    _ controller: StepViewController) {
    if let viewController =
      stepViewController(after: controller) {
      router.present(viewController, animated: true)
    } else {
      router.present(startOverViewController, animated: true)
    }
  }
  
  private func stepViewController(after
    controller: StepViewController) -> StepViewController? {
    guard let index = stepViewControllers
      .firstIndex(where: { $0 === controller }),
      index < stepViewControllers.count - 1 else { return nil }
    return stepViewControllers[index + 1]
  }
}

// MARK: - StartOverViewControllerDelegate
extension HowToCodeCoordinator:
  StartOverViewControllerDelegate {

  public func startOverViewControllerDidPressStartOver(
    _ controller: StartOverViewController) {
    router.dismiss(animated: true)
  }
}



let homeViewController = HomeViewController.instantiate()
let navigationController = UINavigationController(rootViewController: homeViewController)


let router = NavigationRouter(navigationController: navigationController)
let coordinator = HowToCodeCoordinator(router: router)


homeViewController.onButtonPressed = { [weak coordinator] in
  coordinator?.present(animated: true, onDismissed: nil)
}


PlaygroundPage.current.liveView = navigationController
