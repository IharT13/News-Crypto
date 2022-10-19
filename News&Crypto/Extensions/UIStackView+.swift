import UIKit

extension UIStackView {
    func addAllArangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview)
    }
}
