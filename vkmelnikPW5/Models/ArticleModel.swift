//
//  ArticleModel.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import Foundation

// Struct that contains information about article.
struct ArticleModel {
    var title: String
    var description: String
    var imageLink: URL?
    var articleLink: URL?
    
    init() {
        title = "Article title"
        description = "No description"
        imageLink = nil
        articleLink = nil
    }
    
    init(title: String, description: String, imageLink: URL?, articleLink: URL?) {
        self.title = title
        self.description = description
        self.imageLink = imageLink
        self.articleLink = articleLink
    }
}
