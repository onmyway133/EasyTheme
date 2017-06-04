import UIKit
import Themes
import Imaginary
import On
import Hue

struct MyTheme: Theme {
  let topImage: UIImage
  let cellColor: UIColor
  let backgroundColor: UIColor
  let name: String
  let titleFont: UIFont
  let subtitleFont: UIFont
}

class ListController: UITableViewController {

  let items = ItemFactory.make()
  let dayTheme = MyTheme(topImage: UIImage(named: "day")!,
                         cellColor: UIColor(hex: ""),
                         backgroundColor: UIColor(hex: ""),
                         name: "Day",
                         titleFont: UIFont.preferredFont(forTextStyle: .title1),
                         subtitleFont: UIFont.preferredFont(forTextStyle: .body))
  let nightTheme = MyTheme(topImage: UIImage(named: "night")!,
                         cellColor: UIColor(hex: ""),
                         backgroundColor: UIColor(hex: ""),
                         name: "Night",
                         titleFont: UIFont.preferredFont(forTextStyle: .title1),
                         subtitleFont: UIFont.preferredFont(forTextStyle: .body))
  let unicornTheme = MyTheme(topImage: UIImage(named: "unicorn")!,
                         cellColor: UIColor(hex: ""),
                         backgroundColor: UIColor(hex: ""),
                         name: "Unicorn",
                         titleFont: UIFont(name: "Unicorns are Awesome", size: 35)!,
                         subtitleFont: UIFont(name: "Unicorns are Awesome", size: 24)!)
  let starwarTheme = MyTheme(topImage: UIImage(named: "starwar")!,
                         cellColor: UIColor(hex: ""),
                         backgroundColor: UIColor(hex: ""),
                         name: "Stawar",
                         titleFont: UIFont(name: "Star Jedi", size: 14)!,
                         subtitleFont: UIFont(name: "Star Jedi", size: 12)!)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    tableView.separatorStyle = .none

    setupNavigationItems()

    // default theme
    Manager.theme = dayTheme

    theme(MyTheme.self) {
      $0.title = $1.name
      $0.tableView.backgroundColor = $1.backgroundColor
      $0.navigationController?.navigationBar.setBackgroundImage($1.topImage, for: .default)
    }
  }

  func setupNavigationItems() {
    let day = UIBarButtonItem(title: "🌞", style: .plain, target: nil, action: nil)
    let night = UIBarButtonItem(title: "🌙", style: .plain, target: nil, action: nil)
    let unicorn = UIBarButtonItem(title: "🦄", style: .plain, target: nil, action: nil)
    let starwar = UIBarButtonItem(title: "⭐️", style: .plain, target: nil, action: nil)

    navigationItem.leftBarButtonItems = [day, night]
    navigationItem.rightBarButtonItems = [unicorn, starwar]

    day.on.tap {
      Manager.theme = self.dayTheme
    }

    night.on.tap {
      Manager.theme = self.nightTheme
    }

    unicorn.on.tap {
      Manager.theme = self.unicornTheme
    }

    starwar.on.tap {
      Manager.theme = self.starwarTheme
    }
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

