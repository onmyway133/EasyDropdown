import UIKit

public struct Config {

  public struct ArrowButton {

    public struct Text {
      public static var color: UIColor = UIColor.whiteColor()
      public static var font: UIFont = UIFont.boldSystemFontOfSize(17)
    }
  }

  public struct List {

    public struct Text {
      public static var color: UIColor = UIColor.whiteColor()
      public static var font: UIFont = UIFont.boldSystemFontOfSize(15)
    }

    public struct Cell {
      public static var type: UITableViewCell.Type = TableCell.self
      public static var config: (cell: UITableViewCell, item: String, index: Int, selected: Bool) -> Void = { cell, item, index, selected in
        cell.textLabel?.text = item
        cell.accessoryType = selected ? .Checkmark : .None
      }
    }

    public static var backgroundColor: UIColor = UIColor.whiteColor()
  }
}
