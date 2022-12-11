//
//  NewsTopStoriesResponse.swift
//  oekanPW2
//
//  Created by Ольга on 11.12.2022.
//

import Foundation
import UIKit

struct NewsTopStoriesResponse: Codable {
    let articles: [NewsViewModel]
}
