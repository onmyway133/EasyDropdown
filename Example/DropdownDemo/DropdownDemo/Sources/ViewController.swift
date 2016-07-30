import UIKit
import Dropdown

class ViewController: UIViewController {

  lazy var dropdown: DropdownController? = self.makeDropdown()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()

    setupNavigationItem()
  }

  // MARK: - Navigation

  func setupNavigationItem() {
    let button = ArrowButton()

    button.setTitle("Menu", forState: .Normal)
    button.setTitleColor(UIColor.redColor(), forState: .Normal)
    button.addTarget(self, action: #selector(buttonTouched(_:)), forControlEvents: .TouchUpInside)

    navigationItem.titleView = button
  }

  // MARK: - Action

  func buttonTouched(button: UIButton) {
    dropdown?.toggle()
  }

  // MARK: - Dropdown

  func makeDropdown() -> DropdownController? {
    guard let navigationController = navigationController else { return nil }

    let contentController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ContentController") as! ContentController

    let dropdown = DropdownController(contentController: contentController, navigationController: navigationController)
    dropdown?.animationBlock = { [weak self] showing in
      print(self)
    }

    return dropdown
  }
}

