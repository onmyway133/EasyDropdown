import UIKit
import Dropdown

class ViewController: UIViewController {

  let color = UIColor(red: 22/255, green: 160/255, blue: 33/255, alpha: 1)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()

    navigationController?.navigationBar.translucent = false
    navigationController?.navigationBar.barTintColor = color

    setupNavigationItem()
  }

  // MARK: - Navigation

  func setupNavigationItem() {

    let items = ["World", "Sports", "Culture", "Business", "Travel"]
    let titleView = TitleView(navigationController: navigationController!, title: "Menu", items: items)
    titleView?.action = { index in
      print("select \(index)")
    }

    navigationItem.titleView = titleView
  }
}

