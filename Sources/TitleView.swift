import UIKit

open class TitleView: UIView {

  open var dropdown: DropdownController!
  open var button: ArrowButton!
  open var action: ((Int) -> Void)?

  // MARK: - Initialization

  public init?(navigationController: UINavigationController, title: String, items: [String]) {
    super.init(frame: CGRect.zero)

    // Button
    button = ArrowButton()
    button.label.text = title
    button.addTarget(self, action: #selector(buttonTouched(_:)), for: .touchUpInside)
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

    contentController.dismiss = { [weak dropdown] in
      dropdown?.hide()
    }

    dropdown.animationBlock = { [weak self] showing in
      self?.button.arrow.transform = showing
        ? CGAffineTransform(rotationAngle: CGFloat.pi) : CGAffineTransform.identity
    }
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open override func layoutSubviews() {
    super.layoutSubviews()

    button.sizeToFit()
    button.label.sizeToFit()
    button.frame.size.height = 44
    frame.size = button.frame.size
  }

  // MARK: - Action

  @objc func buttonTouched(_ button: ArrowButton) {
    dropdown.toggle()
  }
}
