import FloatingPanel
import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: Public
    
    var coins: [CoinModel] = [] {
        didSet {
            cryptoTableView.reloadData()
            headerView.coins = coins
        }
    }
    
    var wallets: [Wallet] = [] {
        didSet {
            cryptoTableView.reloadData()
        }
    }
    
    var headerView = WelcomeStackView()

    // MARK: Private
    
    private let refreshControl = UIRefreshControl()
    private let panel = FloatingPanelController()
    private let cryptoTableView = UITableView()
    private let searchController = UISearchController()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addSetups()
        refreshTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        headerView.setUserInfo()
        headerView.coreDataSetups()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - Setups

    // MARK: Private

    private func addSubviews() {
        view.addSubview(cryptoTableView)
    }

    private func addSetups() {
        addCryptoTableViewSetups()
        setUpFloatingPanel()
        addHeaderView()
    }
    
    private func addCryptoTableViewSetups() {
        view.backgroundColor = .systemBackground
        cryptoTableView.frame = view.bounds
        cryptoTableView.backgroundColor = .systemBackground
        cryptoTableView.delegate = self
        cryptoTableView.dataSource = self
        cryptoTableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
    }

    private func setUpFloatingPanel() {
        let vc = NewsTableViewController()
        panel.surfaceView.backgroundColor = .theme.cellColor
        panel.set(contentViewController: vc)
        panel.surfaceView.appearance.cornerRadius = 20
        panel.addPanel(toParent: self)
    }
    
    // MARK: - Helpers
    
    // MARK: Private
    
    private func addHeaderView() {
        headerView = WelcomeStackView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 420))
        headerView.delegate = self
        cryptoTableView.tableHeaderView = headerView
    }
    
    private func refreshTable() {
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        cryptoTableView.refreshControl = refreshControl
    }
    
    // MARK: - Actions
    
    // MARK: Private
    
    @objc private func refresh() {
        NetworkingManager.shared.getCoins { [weak self] result in
            self?.coins = result
            self?.refreshControl.endRefreshing()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as? CoinTableViewCell {
            let coin = coins[indexPath.row]
            let changeColor = (coin.priceChangePercentage24H ?? 0.0 < 0)
            cell.set(coin.image,
                     coin.name,
                     coin.symbol.uppercased(),
                     coin.currentPrice.asCurrencyWith6Decimals(),
                     coin.priceChangePercentage24H?.asPercentString() ?? "0.0",
                     changeColor ? .systemRed : .systemGreen,
                     .init(data: coin.sparklineIn7D?.price ?? [],
                           showLegend: false,
                           showAxis: false,
                           fillColor: changeColor ? .systemRed : .systemGreen))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinVC = CoinViewController()
        coinVC.coin = coins[indexPath.row]
        for wallet in wallets {
            if coins[indexPath.row].symbol.uppercased() == wallet.coinSymbol?.uppercased() {
                coinVC.walletButton.isHidden = true
            }
        }
        present(UINavigationController(rootViewController: coinVC), animated: true)
    }
}

extension HomeViewController: TransferActionsBetweenVCDelegate {
    func viewScreen(_ addInvestments: AddInvestmentsViewController) {
        if !coins.isEmpty {
            navigationController?.pushViewController(addInvestments, animated: true)
            addInvestments.coins = coins
        }
    }
}

