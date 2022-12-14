import UIKit

final class SelectImageCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    
    static let identifier = "SelectImageCollectionViewCell"
    
    // MARK: - Properties
    
    // MARK: Private
    
    private let personImageView = UIImageView()
    
    // MARK: Public
    
    override var bounds: CGRect {
            didSet {
                layoutIfNeeded()
            }
        }
    
    // MARK: - LIfecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        addSubviews()
        addContraints()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        addSetups()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    public func set(_ image: String) {
        personImageView.image = UIImage(named: image)
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addContraints() {
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        personImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        personImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        contentView.addSubview(personImageView)
    }
    
    private func addSetups() {
        personImageView.layer.cornerRadius = personImageView.frame.size.width / 2
        personImageView.clipsToBounds = true
        personImageView.contentMode = .scaleAspectFill
    }
}
