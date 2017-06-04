import Foundation

struct ItemFactory {
  static func make() -> [Item] {
    return [
      Item("Liverpool", "Arena/Stadium: Anfield", "https://cloud.githubusercontent.com/assets/2284279/26763340/af804aac-4951-11e7-9006-d0fa8be3d9b5.png"),
      Item("Arsenal", "Arena/Stadium: Emirates Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763350/e2cbda16-4951-11e7-90a8-05aedd871704.jpeg"),
      Item("Chelsea", "Arena/Stadium: Stamford Bridge", "https://cloud.githubusercontent.com/assets/2284279/26763354/f57d48d4-4951-11e7-9212-3069a05f9eb2.png"),
      Item("Manchester United", "Arena/Stadium: Old Trafford", "https://cloud.githubusercontent.com/assets/2284279/26763361/077b75ec-4952-11e7-8885-e87cabd9e790.png"),
      Item("Manchester City", "Arena/Stadium: Etihad Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763364/1bb6d2b8-4952-11e7-88b1-75bf1c0b6ca2.png"),
      Item("Tottenham Hotspur", "Arena/Stadium: Wembley Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763374/2ce65504-4952-11e7-94ce-5c4cb3098ffc.jpeg"),
      Item("Everton", "Arena/Stadium: Goodison Park", "https://cloud.githubusercontent.com/assets/2284279/26763380/48f709c8-4952-11e7-8e23-bbd0f84a1ceb.jpeg"),
      Item("West Ham United", "Arena/Stadium: London Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763389/668c62f8-4952-11e7-8455-3850d3532f48.jpeg"),
      Item("Leicester City", "Arena/Stadium: King Power Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763390/78085276-4952-11e7-8cf5-776fc406b3f1.jpeg"),
      Item("Crystal Palace", "Arena/Stadium: Selhurst Park", "https://cloud.githubusercontent.com/assets/2284279/26763394/8abf4aa0-4952-11e7-8d20-9db42e9b34e6.jpeg"),
      Item("Stoke City", "Arena/Stadium: bet365 Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763398/9c64e42c-4952-11e7-87f8-112674bbded6.png"),
      Item("Swansea City ", "Arena/Stadium: Liberty Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763404/b21576c4-4952-11e7-8452-b1cb6a496ac8.png"),
      Item("Bournemouth", "Training ground: Dean Court", "https://cloud.githubusercontent.com/assets/2284279/26763406/c5ecd570-4952-11e7-87f3-98718f860ffd.png"),
      Item("West Bromwich Albion", "Arena/Stadium: The Hawthorns", "https://cloud.githubusercontent.com/assets/2284279/26763415/df53dd24-4952-11e7-8659-f08b579acd35.jpeg"),
      Item("Burnley", "Arena/Stadium: Turf Moor", "https://cloud.githubusercontent.com/assets/2284279/26763419/efd13b10-4952-11e7-977f-e62e94f23742.jpeg"),
      Item("Southampton ", "Arena/Stadium: St Mary's Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763425/00cfec36-4953-11e7-958e-d93a64eedfc8.jpeg"),
      Item("Middlesbrough", "Arena/Stadium: Riverside Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763428/128e424c-4953-11e7-82b5-fcd4c3983e3a.jpeg"),
      Item("Watford", "Arena/Stadium: Vicarage Road", "https://cloud.githubusercontent.com/assets/2284279/26763432/242a037e-4953-11e7-995a-ff9dd30ba73e.png"),
      Item("Huddersfield Town", "Arena/Stadium: Kirklees Stadium", "https://cloud.githubusercontent.com/assets/2284279/26763442/3ba2381e-4953-11e7-8177-020f04cdea73.jpeg"),
    ]
  }
}
