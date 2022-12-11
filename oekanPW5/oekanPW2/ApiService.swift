//
//  ApiService.swift
//  oekanPW2
//
//  Created by Ольга on 11.12.2022.
//

import Foundation
import UIKit

struct Constants {
    static let baseURL = "https://newsapi.org/v2"
    static let API_KEY = "52e377a2664f41f88b31ab5f6dfe6469"
    static let countryKey = "ru"
}
enum APIError: Error {
    case faieldToGetData
}
    
final class ApiService {
    static let shared = ApiService()
    
    public func getTopStories(completion: @escaping (Result<[NewsViewModel], Error>) -> Void) {
        guard let url = URL(
                string: "\(Constants.baseURL)/top-headinglines?country=\(Constants.countryKey)&apiKey=\(Constants.API_KEY)"
        ) else {
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(NewsTopStoriesResponse.self, from: data)
                
                completion(.success(results.articles))
            } catch {
                completion(.failure(APIError.faieldToGetData))
            }
        }.resume()
    }
}
