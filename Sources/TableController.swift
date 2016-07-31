import UIKit

public class TableController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  let items: [String]
  var selectedIndex: Int

  public lazy var tableView: UITableView = self.makeTableView()
  public var action: ((Int) -> Void)?

  // MARK: - Initialization

  public required init(items: [String], initialIndex: Int) {
    precondition(initialIndex < items.count)

    self.items = items
    self.selectedIndex = initialIndex

    super.init(nibName: nil, bundle: nil)
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.clearColor()

    view.addSubview(tableView)
    tableView.reloadData()
  }

  // MARK: - Layout

  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    view.frame.size.height = tableView.contentSize.height
    tableView.frame = view.bounds
  }

  // MARK: - Controls

  public func makeTableView() -> UITableView {
    let tableView = UITableView()
    tableView.tableFooterView = UIView()

    tableView.dataSource = self
    tableView.delegate = self

    tableView.registerClass(TableCell.self, forCellReuseIdentifier: "Cell")

    return tableView
  }

  // MARK: - DataSource

  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableCell

    let item = items[indexPath.row]
    cell.textLabel?.text = item
    cell.accessoryType = (selectedIndex == indexPath.row) ? .Checkmark : .None

    return cell
  }

  // MARK: - Delegate

  public func tableView(tableView: UITableView,
                        didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    let previousIndexPath = NSIndexPath(forRow: selectedIndex, inSection: 0)
    selectedIndex = indexPath.row
    let selectedIndexPath = NSIndexPath(forRow: selectedIndex, inSection: 0)

    tableView.reloadRowsAtIndexPaths([previousIndexPath, selectedIndexPath], withRowAnimation: .Automatic)

    action?(indexPath.row)
  }
}
