import UIKit

public class TableController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {

  public lazy var tableView: UITableView = self.makeTableView()
  public var action: ((Int) -> Void)?
  public var dismiss: (() -> Void)?

  let items: [String]
  var selectedIndex: Int
  lazy var topView: UIView = self.makeTopView()

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

    view.addSubview(topView)
    view.addSubview(tableView)
    tableView.reloadData()
  }

  // MARK: - Layout

  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    tableView.frame = view.bounds
  }

  // MARK: - Controls

  func makeTableView() -> UITableView {
    let tableView = UITableView()
    tableView.tableFooterView = UIView()
    tableView.backgroundColor = UIColor.clearColor()

    tableView.dataSource = self
    tableView.delegate = self

    tableView.registerClass(TableCell.self, forCellReuseIdentifier: "Cell")

    let gr = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
    gr.cancelsTouchesInView = false
    gr.delegate = self

    tableView.addGestureRecognizer(gr)

    return tableView
  }

  func makeTopView() -> UIView {
    let view = UIView()
    view.backgroundColor = Config.List.backgroundColor

    return view
  }

  // MARK: - Touch

  func viewTapped(gesture: UITapGestureRecognizer) {
    dismiss?()
  }

  // MARK: - GestureDelegate

  public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
    return touch.view is UITableView
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

  // MARK: - ScrollViewDelegate

  public func scrollViewDidScroll(scrollView: UIScrollView) {
    topView.frame = CGRect(x: 0, y: 0,
                           width: scrollView.bounds.size.width,
                           height: abs(scrollView.contentOffset.y))
  }
}
