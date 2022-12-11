//
//  NewsViewModel.swift
//  oekanPW2
//
//  Created by Ольга on 11.12.2022.
//

import Foundation
import UIKit

final class NewsViewModel: Codable {
    let title: String
    let description: String
    let imageURL: URL?
    var imageData: Data? = nil
    var urlToImage: String? = nil
    
    init(title: String, description: String, imageURL: URL?) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
    }
}
