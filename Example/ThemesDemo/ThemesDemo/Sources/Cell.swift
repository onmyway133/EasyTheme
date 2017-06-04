import UIKit
import Hue
import Themes

class Cell: UITableViewCell {
  @IBOutlet weak var container: UIView!
  @IBOutlet weak var myImageView: UIImageView!
  @IBOutlet weak var myTitleLabel: UILabel!
  @IBOutlet weak var mySubtitleLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    myImageView.layer.cornerRadius = 5
    myImageView.layer.masksToBounds = true

    container.layer.cornerRadius = 10
    container.layer.shadowColor = UIColor.black.cgColor
    container.layer.shadowOpacity = 0
    container.layer.shadowOffset = CGSize(width: 1, height: 1)

    theme(MyTheme.self) {
      $0.myTitleLabel.font = $1.titleFont
      $0.mySubtitleLabel.font = $1.subtitleFont
      $0.container.backgroundColor = $1.cellColor
    }
  }
}
