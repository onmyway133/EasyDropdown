import UIKit

public struct Config {

  public static var topLineColor: UIColor = UIColor.darkGray.withAlphaComponent(0.5)

  public struct ArrowButton {

    public struct Text {
      public static var color: UIColor = UIColor.white
      public static var selectedColor: UIColor = UIColor.gray
      public static var font: UIFont = UIFont(name: "Circe", size: 14) ?? UIFont.boldSystemFont(ofSize: 14)
    }
  }

  public struct List {

    public struct DefaultCell {
      
      public struct Text {
        public static var color: UIColor = UIColor.white
        public static var font: UIFont = UIFont(name: "Circe", size: 14) ?? UIFont.systemFont(ofSize: 14)
      }

      public static var separatorColor: UIColor = UIColor.lightGray.withAlphaComponent(0.5)
    }

    public struct Cell {
      public static var type: UITableViewCell.Type = TableCell.self
      public static var config: (_ cell: UITableViewCell, _ item: String, _ index: Int, _ selected: Bool) -> Void = { cell, item, index, selected in
        guard let cell = cell as? TableCell else { return }

        cell.label.text = item
        cell.checkmark.isHidden = !selected
      }
    }

    public static var backgroundColor: UIColor = UIColor(red:238/255.0, green:182/255.0, blue:76/255.0, alpha: 1)
    public static var rowHeight: CGFloat = 50
  }
}
