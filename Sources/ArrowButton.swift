import UIKit

public class ArrowButton: UIButton {

  public lazy var label: UILabel = self.makeLabel()
  public lazy var arrow: UIImageView = self.makeArrow()

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

    arrow.center = CGPoint(x: label.frame.maxX + 10, y: bounds.size.height/2)
  }

  // MARK: - Views

  func makeLabel() -> UILabel {
    let label = UILabel()
    return label
  }

  func makeArrow() -> UIImageView {
    let arrow = UIImageView()
    return arrow
  }
}
