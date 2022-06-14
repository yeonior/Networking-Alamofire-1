//
//  NetworkManager.swift
//  Networking-Alamofire-1
//
//  Created by Ruslan on 13.06.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    // MARK: - Properties
    static let shared = NetworkManager()
    private let url = "https://jsonplaceholder.typicode.com/posts"
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Methods
    public func fetchData(completion: @escaping ([MyModel]) -> Void ) {
        AF.request(url).responseDecodable(of: [MyModel].self) { response in
            switch response.result {
            case .success(let data):
                return completion(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
