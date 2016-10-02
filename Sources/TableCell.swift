import UIKit

open class TableCell: UITableViewCell {

  open lazy var label: UILabel = self.makeLabel()
  open lazy var checkmark: UIImageView = self.makeCheckmark()
  open lazy var separator: UIView = self.makeSeparator()

  // MARK: - Initialization

  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(label)
    contentView.addSubview(checkmark)
    contentView.addSubview(separator)

    setupContraints()

    backgroundColor = Config.List.backgroundColor
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open override func layoutSubviews() {
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
    let checkmark = UIImageView(image: AssetManager.image("checkmark")?.withRenderingMode(.alwaysTemplate))
    checkmark.tintColor = Config.List.DefaultCell.Text.color

    return checkmark
  }

  func makeSeparator() -> UIView {
    let view = UIView()
    view.backgroundColor = Config.List.DefaultCell.separatorColor

    return view
  }

  // MARK: - Constraints

  func setupContraints() {
    // Label
    label.translatesAutoresizingMaskIntoConstraints = false

    contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0))
    contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1, constant: 20))

    // Checkmark
    checkmark.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.addConstraint(NSLayoutConstraint(item: checkmark, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0))
    contentView.addConstraint(NSLayoutConstraint(item: checkmark, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1, constant: -20))
    contentView.addConstraint(NSLayoutConstraint(item: checkmark, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))
    contentView.addConstraint(NSLayoutConstraint(item: checkmark, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))

    // Separator
    separator.translatesAutoresizingMaskIntoConstraints = false

    contentView.addConstraint(NSLayoutConstraint(item: separator, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0))
    contentView.addConstraint(NSLayoutConstraint(item: separator, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1, constant: 0))
    contentView.addConstraint(NSLayoutConstraint(item: separator, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1, constant: 0))
    contentView.addConstraint(NSLayoutConstraint(item: separator, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0.5))
  }
}
