import UIKit
import Kingfisher

final class CoinTableViewCell: UITableViewCell {
    
    private let coinStackView = UIStackView()
    private let coinImageView = UIImageView()
    private let infoStackView = UIStackView()
    private let nameCoinLabel = UILabel()
    private let symbolLabel = UILabel()
    private let chart = CryptoLineChartView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
