import UIKit

public struct Config {

  public static var topLineColor: UIColor = UIColor.darkGray.withAlphaComponent(0.8)

  public struct ArrowButton {

    public struct Text {
      public static var color: UIColor = UIColor.black
      public static var selectedColor: UIColor = UIColor.gray
      public static var font: UIFont = UIFont.boldSystemFont(ofSize: 18)
    }
  }

  public struct List {

    public struct DefaultCell {
      
      public struct Text {
        public static var color: UIColor = UIColor.white
        public static var font: UIFont = UIFont.systemFont(ofSize: 16)
      }

      public static var separatorColor: UIColor = UIColor.lightGray.withAlphaComponent(0.5)
    }

    public struct Cell {
      public static var type: UITableViewCell.Type = TableCell.self
      public static var config: (_ cell: UITableViewCell, _ item: String, _ index: Int, _ selected: Bool) -> Void = { cell, item, index, selected in
        guard let cell = cell as? TableCell else { return }

        cell.label.text = item.uppercased()
        cell.checkmark.isHidden = !selected
      }
    }

    public static var backgroundColor: UIColor = UIColor(red: 65/255, green: 143/255, blue: 152/255, alpha: 1)
    public static var rowHeight: CGFloat = 50
  }
}
