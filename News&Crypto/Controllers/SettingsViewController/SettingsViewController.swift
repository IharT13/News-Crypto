import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - Properties

    // MARK: Private
    
    private let scrollView = UIScrollView()
    private let mainStackView = UIStackView()
    private let profileLabel = UILabel()
    private let personImage = PersonImageStackView()
    private let infoView = InfoView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addSetups()
        addContraints()
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addContraints() {
        addScrollViewConstraints()
        addMainStackViewConstraints()
        addPersonImageAndInfoHeightConstraints()
    }
    
    private func addScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
    
    private func addMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        mainStackView.heightAnchor.constraint(equalToConstant: 535).isActive = true
    }
    
    private func addPersonImageAndInfoHeightConstraints() {
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        profileLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/8).isActive = true
        personImage.translatesAutoresizingMaskIntoConstraints = false
        personImage.heightAnchor.constraint(equalToConstant: 190).isActive = true
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.heightAnchor.constraint(equalToConstant: 310).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        view.addSubviews(scrollView,
                         profileLabel)
        scrollView.addSubview(mainStackView)
        mainStackView.addAllArrangedSubviews(personImage,
                                          infoView)
    }
    
    private func addSetups() {
        view.backgroundColor = .systemBackground
        addMainStackViewSetups()
        addProfileLabelSetups()
    }
    
    private func addMainStackViewSetups() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillProportionally
        mainStackView.alignment = .fill
        mainStackView.spacing = 30
    }
    
    private func addProfileLabelSetups() {
        profileLabel.text = "Profile"
        profileLabel.font = .montserrat(24, .bold)
        profileLabel.textAlignment = .center
        profileLabel.backgroundColor = .theme.cellColor
        profileLabel.layer.cornerRadius = 20
        profileLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        profileLabel.layer.masksToBounds = true
    }
}

