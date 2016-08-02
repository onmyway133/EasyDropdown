import UIKit

public struct Config {

  public struct ArrowButton {

    public struct Text {
      public static var color: UIColor = UIColor.whiteColor()
      public static var font: UIFont = UIFont.boldSystemFontOfSize(17)
    }
  }

  public struct List {

    public struct DefaultCell {
      
      public struct Text {
        public static var color: UIColor = UIColor.blackColor()
        public static var font: UIFont = UIFont.boldSystemFontOfSize(15)
      }

      public static var backgroundColor: UIColor = UIColor.whiteColor()
    }

    public struct Cell {
      public static var type: UITableViewCell.Type = TableCell.self
      public static var config: (cell: UITableViewCell, item: String, index: Int, selected: Bool) -> Void = { cell, item, index, selected in
        guard let cell = cell as? TableCell else { return }

        cell.label.text = item
        cell.checkmark.hidden = !selected
      }
    }

    public static var backgroundColor: UIColor = UIColor.whiteColor()
  }
}
