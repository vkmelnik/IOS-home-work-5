//
//  ArticleManager.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import Foundation

protocol ArticleManagerObserver {
    func updateArticles()
}

// Class that contains articles and manages their logic.
class ArticleManager {
    var observer: ArticleManagerObserver?
    
    public var Articles: [ArticleModel] = [] {
        didSet {
            observer?.updateArticles()
        }
    }
}
