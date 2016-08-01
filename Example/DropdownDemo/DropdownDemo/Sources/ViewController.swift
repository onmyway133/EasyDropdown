import UIKit
import Dropdown

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()

    navigationController?.navigationBar.barTintColor = UIColor(red: 22/255, green: 160/255, blue: 33/255, alpha: 1)

    setupNavigationItem()
  }

  // MARK: - Navigation

  func setupNavigationItem() {
    let items = ["World", "Sports", "Culture", "Business", "Travel"]

    navigationItem.titleView = TitleView(navigationController: navigationController!, title: "Menu", items: items)
  }
}

