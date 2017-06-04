import UIKit
import Themes
import Imaginary
import On

class ListController: UITableViewController {

  let items = ItemFactory.make()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    tableView.separatorStyle = .none

    let day = UIBarButtonItem(title: "🌞", style: .plain, target: nil, action: nil)
    let night = UIBarButtonItem(title: "🌙", style: .plain, target: nil, action: nil)
    let unicorn = UIBarButtonItem(title: "🦄", style: .plain, target: nil, action: nil)
    let starwar = UIBarButtonItem(title: "⭐️", style: .plain, target: nil, action: nil)

    navigationItem.leftBarButtonItems = [day, night]
    navigationItem.rightBarButtonItems = [unicorn, starwar]
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    tableView.reloadData()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
    let item = items[indexPath.row]

    cell.myImageView.setImage(url: URL(string: item.imageUrl)!)
    cell.myTitleLabel.text = item.title
    cell.mySubtitleLabel.text = item.subtitle

    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

