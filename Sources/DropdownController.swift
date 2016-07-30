import UIKit

public typealias AnimationBlock = (Bool) -> Void

public class DropdownController: UIViewController {

  public var animationBlock: AnimationBlock?

  weak var containerView: UIView?
  var initialY: CGFloat = 0

  // MARK: - Initialization

  public convenience init?(navigationController: UINavigationController) {
    let initialY = navigationController.navigationBar.frame.height
      + UIApplication.sharedApplication().statusBarFrame.height

    guard let containerView = navigationController.tabBarController?.view ?? navigationController.view
      else { return nil }

    self.init(containerView: containerView, initialY: initialY)
  }

  public required init(containerView: UIView, initialY: CGFloat) {
    super.init(nibName: nil, bundle: nil)
    self.containerView = containerView
    self.initialY = initialY
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // Showing

  public func show() {
    toggle(true)
  }

  public func hide() {
    toggle(false)
  }

  func toggle(showing: Bool) {
    guard let containerView = containerView else { return }

    if showing {
      containerView.addSubview(view)
      view.frame = containerView.bounds
    }

    UIView.animateWithDuration(0.25, delay: 0,
                               usingSpringWithDamping: 1,
                               initialSpringVelocity: 1,
                               options: [],
                               animations:
      {
        self.animationBlock?(showing)

      }, completion: { (finished) in
        if !showing {
          self.view.removeFromSuperview()
        }
    })
  }
}
