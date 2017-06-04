import Foundation

struct Item {
  let title: String
  let subtitle: String
  let imageUrl: String

  init(_ title: String, _ subtitle: String, _ imageUrl: String) {
    self.title = title
    self.subtitle = subtitle
    self.imageUrl = imageUrl
  }
}
