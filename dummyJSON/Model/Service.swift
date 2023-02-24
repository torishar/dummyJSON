//
//  Service.swift
//  dummyJSON
//
//  Created by Viktoriia Sharukhina on 19.02.2023.
//

import Foundation

class Service {
    
    func sendRequest (complition: @escaping (Result<AllUsers, Error>) -> Void) {
        
        let urlString = "https://dummyjson.com/users"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    complition(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let users = try JSONDecoder().decode(AllUsers.self, from: data)
                    complition(.success(users))
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    complition(.failure(jsonError))
                }
            }
        }.resume()
    }
}



