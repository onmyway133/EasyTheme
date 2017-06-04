import UIKit
import Themes

class ListController: UITableViewController {

  let items = ItemFactory.make()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    tableView.reloadData()
  }
}

