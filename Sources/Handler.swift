import Foundation

/// Managed by ThemeUser to handle theme change notification
class Handler {
  var observer: NSObjectProtocol!

  weak var host: ThemeUser?
  var mapping = [String: (ThemeUser, Theme) -> Void]()

  init(host: ThemeUser) {
    self.host = host
  }

  func observe() {
    observer = NotificationCenter.default.addObserver(
      forName: Notification.Name.themeDidChange,
      object: ThemeManager.shared,
      queue: OperationQueue.main,
      using: { [weak self] _ in
        self?.handle()
    })
  }

  func handle() {
    guard let host = host else {
      return
    }

    guard let theme = ThemeManager.shared.currentTheme else {
      return
    }

    guard let action = mapping[String(describing: type(of: theme))] else {
      return
    }

    action(host, theme)
  }

  deinit {
    NotificationCenter.default.removeObserver(observer)
  }
}

