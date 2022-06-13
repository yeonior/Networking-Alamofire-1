//
//  MyModel.swift
//  Networking-Alamofire-1
//
//  Created by Ruslan on 13.06.2022.
//

struct MyModel: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
