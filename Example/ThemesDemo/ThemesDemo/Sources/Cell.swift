import UIKit
import Hue

class Cell: UITableViewCell {
  @IBOutlet weak var container: UIView!
  @IBOutlet weak var myImageView: UIImageView!
  @IBOutlet weak var myTitleLabel: UILabel!
  @IBOutlet weak var mySubtitleLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    myImageView.layer.cornerRadius = 5

    container.layer.cornerRadius = 5
    container.backgroundColor = UIColor(hex: "#27ae60")
    container.layer.shadowColor = UIColor.black.cgColor
    container.layer.shadowOpacity = 0
    container.layer.shadowOffset = CGSize(width: 1, height: 1)
  }
}
