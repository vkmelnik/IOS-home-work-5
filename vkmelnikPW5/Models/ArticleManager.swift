//
//  ArticleManager.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import Foundation

// Class that contains articles and manages their logic.
class ArticleManager {
    private var articles: [ArticleModel] = []
    
    public var Articles: [ArticleModel] {
        get {
            return articles
        }
        
        set {
            articles = newValue
        }
    }
}
