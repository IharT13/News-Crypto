import UIKit
import FloatingPanel


final class HomeViewController: UIViewController {
    
    var coins = [CoinModel]() {
        didSet {
            cryptoTableView.reloadData()
        }
    }
    
    var wallets = [Wallet]() {
        didSet {
            cryptoTableView.reloadData()
        }
    }
    
    private let refreshControl = UIRefreshControl()
    private let panel = FloatingPanelController()
    private let cryptoTableView = UITableView()
    private let searchController = UISearchController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


    
    
    
    
    
    
    
    
    
    
    
}
