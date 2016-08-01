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
    button.label.text = title
    button.addTarget(self, action: #selector(buttonTouched(_:)), forControlEvents: .TouchUpInside)
    addSubview(button)

    // Content
    let contentController = TableController(items: items, initialIndex: 0)

    // Dropdown
    guard let dropdown = DropdownController(contentController: contentController, navigationController: navigationController)
      else { return nil }

    self.dropdown = dropdown

    contentController.action = { [weak self, weak dropdown] index in
      self?.button.label.text = items[index]
      self?.action?(index)
      self?.layoutSubviews()
      dropdown?.hide()
    }

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

    button.sizeToFit()
    frame.size = button.frame.size
  }

  // MARK: - Action

  func buttonTouched(button: ArrowButton) {
    dropdown.toggle()
  }
}
