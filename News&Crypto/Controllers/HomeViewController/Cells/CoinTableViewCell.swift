import Kingfisher
import UIKit

final class CoinTableViewCell: UITableViewCell {
    // MARK: - Identifier
    
    static let identifier = "CoinTableViewCell"
    
    // MARK: - Properties
    
    // MARK: Private

    private let coinStackView = UIStackView()
    private let coinImageView = UIImageView()
    private let infoStackView = UIStackView()
    private let nameCoinLabel = UILabel()
    private let symbolLabel = UILabel()
    private let chart = CryptoLineChartView()
    private let priceStackView = UIStackView()
    private let priceLabel = UILabel()
    private let changeLabel = UILabel()
    private var changeColor = UIColor() {
        didSet {
            changeLabel.textColor = changeColor
        }
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addSetups()
        addConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func set(_ image: String, _ nameCoin: String, _ symbol: String, _ price: String, _ change: String, _ color: UIColor, _ data: CryptoLineChartView.ViewModel) {
        coinImageView.kf.setImage(with: URL(string: image))
        nameCoinLabel.text = nameCoin
        symbolLabel.text = symbol + "/USD"
        priceLabel.text = price
        changeLabel.text = change
        changeColor = color
        chart.configure(viewModel: data)
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async { [weak self] in
            self?.addCoinImageViewSetups()
        }
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addConstraints() {
        addCoinStackViewConstraints()
        addCoinImageViewConstraints()
        addChartViewConstraints()
        addInfoStackViewConstraints()
    }
    
    private func addCoinStackViewConstraints() {
        coinStackView.translatesAutoresizingMaskIntoConstraints = false
        coinStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        coinStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        coinStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        coinStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func addInfoStackViewConstraints() {
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.widthAnchor.constraint(equalTo: coinStackView.widthAnchor, multiplier: 0.25).isActive = true
    }
    
    private func addCoinImageViewConstraints() {
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        coinImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func addChartViewConstraints() {
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.widthAnchor.constraint(equalTo: coinStackView.widthAnchor, multiplier: 0.3).isActive = true
        chart.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        contentView.addSubview(coinStackView)
        coinStackView.addAllArrangedSubviews(coinImageView,
                                          infoStackView,
                                          chart,
                                          priceStackView)
        infoStackView.addAllArrangedSubviews(nameCoinLabel,
                                          symbolLabel)
        priceStackView.addAllArrangedSubviews(priceLabel,
                                           changeLabel)
    }
    
    private func addSetups() {
        addContentViewSetups()
        addCoinStackViewSetups()
        addInfoStackViewSetups()
        addPriceStackViewSetups()
        addNameCoinLabelSetups()
        addSymbolLabelSetups()
        addPriceLabelSetups()
        addChangeLabelSetups()
        addChartViewSetups()
    }
    
    private func addContentViewSetups() {
        contentView.backgroundColor = .systemBackground
    }
    
    private func addCoinStackViewSetups() {
        coinStackView.axis = .horizontal
        coinStackView.distribution = .fillProportionally
        coinStackView.alignment = .center
        coinStackView.spacing = 15
        coinStackView.backgroundColor = .systemBackground
    }
    
    private func addInfoStackViewSetups() {
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillProportionally
        infoStackView.alignment = .fill
    }
    
    private func addPriceStackViewSetups() {
        priceStackView.axis = .vertical
        priceStackView.distribution = .fillProportionally
        priceStackView.alignment = .trailing
    }
    
    private func addCoinImageViewSetups() {
        coinImageView.layer.cornerRadius = coinImageView.frame.size.width / 2
        coinImageView.clipsToBounds = true
        coinImageView.contentMode = .scaleAspectFill
    }
    
    private func addNameCoinLabelSetups() {
        nameCoinLabel.font = .montserrat(17, .medium)
    }
    
    private func addSymbolLabelSetups() {
        symbolLabel.font = .montserrat(15, .regular)
        symbolLabel.textColor = .gray
    }
    
    private func addPriceLabelSetups() {
        priceLabel.font = .montserrat(16, .medium)
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.minimumScaleFactor = 0.5
    }
    
    private func addChangeLabelSetups() {
        changeLabel.font = .montserrat(13, .regular)
    }
    
    private func addChartViewSetups() {
        chart.clipsToBounds = true
        chart.isUserInteractionEnabled = false
    }
}
