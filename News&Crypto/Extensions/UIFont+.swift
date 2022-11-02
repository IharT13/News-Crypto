import UIKit

enum FontWeight: String {
    case bold = "Montserrat-Bold"
    case medium = "Montserrat-Medium"
    case regular = "Montserrat-Regular"
    case semibold = "Montserrat-SemiBold"
    
    case bold1 = "Altone-Bold"
    case extraBold = "Altone-ExtraBold"
    case extraLight = "Altone-ExtraLight"
    case light = "Altone-Light"
    case medium1 = "Altone-Medium"
    case regular1 = "Altone-Regular"
    case semiBold1 = "Altone-SemiBold"
    case thin = "Altone-Thin"
}

extension UIFont {

    static func montserrat(_ size: CGFloat, _ weight: FontWeight) -> UIFont {
         UIFont(name: weight.rawValue, size: size)!
    }
    static func altone(_ size: CGFloat, _ weight: FontWeight) -> UIFont {
        UIFont(name: weight.rawValue, size: size)!
    }

}
