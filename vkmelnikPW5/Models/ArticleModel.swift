//
//  ArticleModel.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import UIKit

struct ImageContainer: Decodable {
    var url: URL?
}

// Struct that contains information about article.
struct ArticleModel: Decodable {
    var newsId: Int?
    var title: String?
    var announce: String?
    var img: ImageContainer?
    var requestId: String?
    
    var articleUrl: URL? {
        let requestId = requestId ?? ""
        let newsId = newsId ?? 0
        return URL(string: "https://news.myseldon.com/ru/news/index/\(newsId)?requestId=\(requestId)"
        )
    }
}
