import UIKit
import Themes
import DayNightSwitch

struct MyTheme: Theme {
  let image: UIImage
  let textColor: UIColor

  init(image: UIImage, textColor: UIColor) {
    self.image = image
    self.textColor = textColor
  }
}

struct ThemeList {
  static let day = MyTheme(image: UIImage(named: "day")!, textColor: UIColor.darkGray)
  static let night = MyTheme(image: UIImage(named: "night")!, textColor: UIColor.white)
}

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var degreeLabel: UILabel!
  @IBOutlet weak var weatherLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    Manager.theme = ThemeList.day

    let dayNightSwitch = DayNightSwitch(frame: CGRect(x: view.bounds.size.width - 120,
                                                      y: view.bounds.size.height - 70,
                                                      width: 100, height: 50))
    view.addSubview(dayNightSwitch)
    dayNightSwitch.on = true

    use(MyTheme.self) { controller, theme in
      UIView.transition(with: controller.imageView,
                        duration: 0.25,
                        options: .transitionCrossDissolve,
                        animations: {
        controller.imageView.image = theme.image
      }, completion: nil)

      controller.cityLabel.textColor = theme.textColor
      controller.timeLabel.textColor = theme.textColor
    }

    dayNightSwitch.changeAction = { on in
      ThemeManager.currentTheme = on ? ThemeList.day : ThemeList.night
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

