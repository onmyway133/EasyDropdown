import UIKit

public class TableCell: UITableViewCell {

  public lazy var label: UILabel = self.makeLabel()
  public lazy var checkmark: UIImageView = self.makeCheckmark()

  // MARK: - Initialization

  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(label)
    contentView.addSubview(checkmark)

    setupContraints()

    backgroundColor = Config.List.DefaultCell.backgroundColor
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func layoutSubviews() {
    super.layoutSubviews()

    contentView.frame = bounds
  }

  // MARK: - Controls

  func makeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = Config.List.DefaultCell.Text.color
    label.font = Config.List.DefaultCell.Text.font

    return label
  }

  func makeCheckmark() -> UIImageView {
    let checkmark = UIImageView(image: AssetManager.image("checkmark")?.imageWithRenderingMode(.AlwaysTemplate))
    checkmark.tintColor = Config.List.DefaultCell.Text.color

    return checkmark
  }

  // MARK: - Constraints

  func setupContraints() {
    // Label
    label.translatesAutoresizingMaskIntoConstraints = false

    contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1, constant: 0))
    contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1, constant: 10))

    // Checkmark
    checkmark.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.addConstraint(NSLayoutConstraint(item: checkmark, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1, constant: 0))
    contentView.addConstraint(NSLayoutConstraint(item: checkmark, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1, constant: -10))
    contentView.addConstraint(NSLayoutConstraint(item: checkmark, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 15))
    contentView.addConstraint(NSLayoutConstraint(item: checkmark, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 15))
  }
}
