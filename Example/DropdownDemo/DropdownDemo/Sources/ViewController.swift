import UIKit
import Dropdown

class ViewController: UIViewController {

  lazy var dropdown: DropdownController? = self.makeDropdown()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()

    navigationController?.navigationBar.barTintColor = UIColor(red: 22/255, green: 160/255, blue: 33/255, alpha: 1)

    setupNavigationItem()
  }

  // MARK: - Navigation

  func setupNavigationItem() {
    let button = ArrowButton()

    button.setTitle("Menu", forState: .Normal)
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

    let items = ["World", "Sports", "Culture", "Business", "Travel"]
    let contentController = TableController(items: items, initialIndex: 0)
    contentController.action = { [weak self] index in
      guard let button = self?.navigationItem.titleView as? ArrowButton
        else { return }

      button.label.text = items[index]
      self?.dropdown?.hide()
    }

    let dropdown = DropdownController(contentController: contentController, navigationController: navigationController)
    dropdown?.animationBlock = { [weak self] showing in
      guard let button = self?.navigationItem.titleView as? ArrowButton
        else { return }

      button.arrow.transform = showing
        ? CGAffineTransformMakeRotation(CGFloat(M_PI)) : CGAffineTransformIdentity
    }

    return dropdown
  }
}

