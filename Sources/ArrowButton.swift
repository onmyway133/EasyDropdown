import UIKit

public class ArrowButton: UIButton {

  public lazy var label: UILabel = self.makeLabel()
  public lazy var arrow: UIImageView = self.makeArrow()

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

  public override func layoutSubviews() {
    super.layoutSubviews()

    label.center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)

    arrow.frame.size = CGSize(width: arrowSize, height: arrowSize)
    arrow.center = CGPoint(x: label.frame.maxX + padding, y: bounds.size.height / 2)
  }

  public override func sizeThatFits(size: CGSize) -> CGSize {
    label.sizeToFit()

    return CGSize(width: label.frame.size.width + arrowSize*2 + padding,
                  height: label.frame.size.height)
  }

  // MARK: - Views

  func makeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = Config.ArrowButton.Text.color
    label.font = Config.ArrowButton.Text.font
    label.textAlignment = .Center

    return label
  }

  func makeArrow() -> UIImageView {
    let arrow = UIImageView()
    arrow.image = AssetManager.image("dropdown_arrow")?.imageWithRenderingMode(.AlwaysTemplate)
    arrow.tintColor = Config.ArrowButton.Text.color

    return arrow
  }
}
