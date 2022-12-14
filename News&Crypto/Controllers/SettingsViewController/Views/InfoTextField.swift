import UIKit

final class InfoTextField: UIView {
    // MARK: - Properties

    // MARK: Private

    private let stackView = UIStackView()
    private let iconImageView = UIImageView()
    private let infoTextField = UITextField()
    
    // MARK: Public
    
    var isAutoCorrectionEnabled: Bool = true {
        didSet {
            infoTextField.autocorrectionType = isAutoCorrectionEnabled ? .yes : .no
        }
    }
    
    var text: String {
        get {
            infoTextField.text ?? ""
        }
        set {
            infoTextField.text = newValue
        }
    }

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
        addContraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    public func configurator(_ image: String, _ placeholder: String, _ type: UIKeyboardType = .default) {
        iconImageView.image = UIImage(systemName: image)
        infoTextField.placeholder = placeholder
        infoTextField.keyboardType = type
    }
    
    public func date(_ image: String, toolbar: UIToolbar, inputView: UIView) {
        iconImageView.image = UIImage(systemName: image)
        infoTextField.inputAccessoryView = toolbar
        infoTextField.inputView = inputView
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addContraints() {
        addStackViewConstraints()
        addIconImageViewConstraint()
        addInfoTextFieldConstraints()
    }
    
    private func addStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func addIconImageViewConstraint() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func addInfoTextFieldConstraints() {
        infoTextField.translatesAutoresizingMaskIntoConstraints = false
        infoTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    // MARK: - Setups

    // MARK: Private

    private func addSubviews() {
        addSubview(stackView)
        stackView.addAllArrangedSubviews(iconImageView, infoTextField)
    }

    private func addSetups() {
        addInfoViewSetups()
        addStackViewSetups()
        addInfoTextFieldSetups()
    }

    private func addInfoViewSetups() {
        iconImageView.tintColor = .theme.accent
        backgroundColor = .theme.cellColor
        layer.cornerRadius = 10
        addShadow()
    }
    
    private func addStackViewSetups() {
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 10
    }
    
    private func addInfoTextFieldSetups() {
        infoTextField.layer.cornerRadius = 15
        infoTextField.keyboardType = .numberPad
    }
}
