import UIKit
import Dropdowns

class ViewController: UIViewController {

  @IBOutlet weak var button: UIButton!

  let color = UIColor(red: 22/255, green: 160/255, blue: 33/255, alpha: 1)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

    button.layer.cornerRadius = 4

    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.barTintColor = color

    setupNavigationItem()
  }

  // MARK: - Navigation

  func setupNavigationItem() {

    let items = ["World", "Sports", "Culture", "Business", "Travel"]
    let titleView = TitleView(navigationController: navigationController!, title: "Menu", items: items)
    titleView?.action = { [weak self] index in
      self?.button.setTitle(items[index], for: .normal)
      self?.button.layoutIfNeeded()
    }

    navigationItem.titleView = titleView
  }
}

