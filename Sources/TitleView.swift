import UIKit

public class TitleView: UIView {

  public var dropdown: DropdownController!
  public var button: ArrowButton!
  public var action: ((Int) -> Void)?

  // MARK: - Initialization

  public init?(navigationController: UINavigationController, title: String, items: [String]) {
    super.init(frame: CGRect.zero)

    // Button
    button = ArrowButton()
    button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    button.setTitle(title, forState: .Normal)
    button.addTarget(self, action: #selector(buttonTouched(_:)), forControlEvents: .TouchUpInside)
    addSubview(button)

    // Content
    let contentController = TableController(items: items, initialIndex: 0)
    contentController.action = { [weak self] index in
      self?.button.label.text = items[index]
      self?.action?(index)
    }

    // Dropdown
    guard let dropdown = DropdownController(contentController: contentController, navigationController: navigationController)
      else { return nil }

    self.dropdown = dropdown
    dropdown.animationBlock = { [weak self] showing in
      self?.button.arrow.transform = showing
        ? CGAffineTransformMakeRotation(CGFloat(M_PI)) : CGAffineTransformIdentity
    }
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func layoutSubviews() {
    super.layoutSubviews()

    button.frame = bounds
  }

  // MARK: - Action

  func buttonTouched(button: ArrowButton) {
    dropdown.toggle()
  }
}
