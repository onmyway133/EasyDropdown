import UIKit

open class ArrowButton: UIButton {

  open lazy var label: UILabel = self.makeLabel()
  open lazy var arrow: UIImageView = self.makeArrow()

  let padding: CGFloat = 10
  let arrowSize: CGFloat = 15

  public init() {
    super.init(frame: CGRect.zero)

    addSubview(label)
    addSubview(arrow)
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open override func layoutSubviews() {
    super.layoutSubviews()

    label.center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
    arrow.frame.size = CGSize(width: arrowSize, height: arrowSize)
    arrow.center = CGPoint(x: label.frame.maxX + padding, y: bounds.size.height / 2)
  }

  open override func sizeThatFits(_ size: CGSize) -> CGSize {
    return CGSize(width: label.frame.size.width + arrowSize*2 + padding,
                  height: label.frame.size.height)
  }

  // MARK: - Views

  func makeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = Config.ArrowButton.Text.color
    label.font = Config.ArrowButton.Text.font
    label.textAlignment = .center

    return label
  }

  func makeArrow() -> UIImageView {
    let arrow = UIImageView()
    arrow.image = AssetManager.image("dropdown_arrow")?.withRenderingMode(.alwaysTemplate)
    arrow.tintColor = Config.ArrowButton.Text.color

    return arrow
  }

  // MARK: - Touch

  open override var isHighlighted: Bool {
    didSet {
      label.textColor = isHighlighted ? Config.ArrowButton.Text.selectedColor : Config.ArrowButton.Text.color
      arrow.tintColor = isHighlighted ? Config.ArrowButton.Text.selectedColor : Config.ArrowButton.Text.color
    }
  }
}
