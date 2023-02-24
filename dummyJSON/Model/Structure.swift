//
//  Structure.swift
//  dummyJSON
//
//  Created by Viktoriia Sharukhina on 19.02.2023.
//

import Foundation

struct AllUsers: Decodable {
    var users: [Users]
}

struct Users: Decodable, Hashable {
    var image: String?
    var firstName: String?
    var lastName: String?
    var phone: String?
    var age: Int?
}
