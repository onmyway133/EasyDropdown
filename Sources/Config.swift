import UIKit

public struct Config {

  public struct ArrowButton {

    public struct Text {
      public static var color: UIColor = UIColor.whiteColor()
      public static var font: UIFont = UIFont.boldSystemFontOfSize(18)
    }
  }

  public struct List {

    public struct DefaultCell {
      
      public struct Text {
        public static var color: UIColor = UIColor.whiteColor()
        public static var font: UIFont = UIFont.systemFontOfSize(16)
      }
    }

    public struct Cell {
      public static var type: UITableViewCell.Type = TableCell.self
      public static var config: (cell: UITableViewCell, item: String, index: Int, selected: Bool) -> Void = { cell, item, index, selected in
        guard let cell = cell as? TableCell else { return }

        cell.label.text = item.uppercaseString
        cell.checkmark.hidden = !selected
      }
    }

    public static var backgroundColor: UIColor = UIColor(red: 86/255, green: 111/255, blue: 143/255, alpha: 1)
    public static var separatorColor: UIColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
    public static var rowHeight: CGFloat = 60
  }
}
