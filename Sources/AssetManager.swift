import UIKit

class AssetManager {

  static func image(_ named: String) -> UIImage? {
    let bundle = Bundle(for: AssetManager.self)
    return UIImage(named: "Dropdown.bundle/\(named)", in: bundle, compatibleWith: nil)
  }
}
