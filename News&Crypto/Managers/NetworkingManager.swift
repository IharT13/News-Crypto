import Alamofire
import Foundation

final class NetworkingManager {
    // MARK: - Shared
    static let shared = NetworkingManager()

    // MARK: - Enums
    private enum Constants: String {
        case apiKey = "&token=cdr8p8qad3i0p7dfl510cdr8p8qad3i0p7dfl51g"
        case newsBaseUrl = "https://finnhub.io/api/v1/"
        case coinBaseUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    }

    private enum Endpoint: String {
        case search = "search?q="
        case topStories = "news?category=general&"
    }

    // MARK: Requests
    func getNews(completion: @escaping (([NewsStory]) -> Void)) {
        AF.request(Constants.newsBaseUrl.rawValue + Endpoint.topStories.rawValue + Constants.apiKey.rawValue).responseDecodable(of: [NewsStory].self) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCoins(completion: @escaping (([CoinModel]) -> Void)) {
        AF.request(Constants.coinBaseUrl.rawValue).responseDecodable(of: [CoinModel].self) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error)
            }
        }
    }

    private init() {}
}
