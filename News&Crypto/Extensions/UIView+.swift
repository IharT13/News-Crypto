import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview)
    }
    
    func addShadow() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 15
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
    }
}
