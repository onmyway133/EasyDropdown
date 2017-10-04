import UIKit

open class TableController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {

  open lazy var tableView: UITableView = self.makeTableView()
  open var action: ((Int) -> Void)?
  open var dismiss: (() -> Void)?

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

  open override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.clear

    view.addSubview(topView)
    view.addSubview(tableView)
    tableView.reloadData()
  }

  // MARK: - Layout

  open override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    tableView.frame = view.bounds
  }

  // MARK: - Controls

  func makeTableView() -> UITableView {
    let tableView = UITableView()
    tableView.tableFooterView = UIView()
    tableView.backgroundColor = UIColor.clear
    tableView.rowHeight = Config.List.rowHeight
    tableView.separatorStyle = .none

    tableView.dataSource = self
    tableView.delegate = self

    tableView.register(Config.List.Cell.type, forCellReuseIdentifier: String(describing: Config.List.Cell.type))

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

  @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
    dismiss?()
  }

  // MARK: - GestureDelegate

  open func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    return touch.view is UITableView
  }

  // MARK: - DataSource

  open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Config.List.Cell.type), for: indexPath)

    let item = items[(indexPath as NSIndexPath).row]
    Config.List.Cell.config(cell, item, (indexPath as NSIndexPath).row, (selectedIndex == (indexPath as NSIndexPath).row))

    return cell
  }

  // MARK: - Delegate

  open func tableView(_ tableView: UITableView,
                        didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    let previousIndexPath = IndexPath(row: selectedIndex, section: 0)
    selectedIndex = (indexPath as NSIndexPath).row
    let selectedIndexPath = IndexPath(row: selectedIndex, section: 0)

    tableView.reloadRows(at: [previousIndexPath, selectedIndexPath], with: .automatic)

    action?((indexPath as NSIndexPath).row)
  }

  // MARK: - ScrollViewDelegate

  open func scrollViewDidScroll(_ scrollView: UIScrollView) {
    topView.frame = CGRect(x: 0, y: 0,
                           width: scrollView.bounds.size.width,
                           height: abs(scrollView.contentOffset.y))
  }
}
