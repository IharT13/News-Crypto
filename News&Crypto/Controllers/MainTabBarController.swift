import UIKit


// MARK: - Outlets
// MARK: - Actions
// MARK: - Properties
// MARK: Public
// MARK: Private
// MARK: - Lifecycle
// MARK: - API
// MARK: - Setups
// MARK: - Helpers

final class MainTabBarController: UITabBarController {
    
    private let homeViewController = UINavigationController(rootViewController: HomeViewController())
    private let settingsViewController = SettingsViewController()
    private let walletTableViewController = WalletTableTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupUITabBar()
    }

    private func setupTabBar() {
        setViewControllers([homeViewController, walletTableViewController, settingsViewController], animated: true)
    }

    private func setupUITabBar() {
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        settingsViewController.tabBarItem.image = UIImage(systemName: "wallet.pass")
        walletTableViewController.tabBarItem.image = UIImage(systemName: "gear")
        
        homeViewController.title = "House"
        settingsViewController.title = "Settings"
        walletTableViewController.title = "Wallet"
    }
    
    
}

