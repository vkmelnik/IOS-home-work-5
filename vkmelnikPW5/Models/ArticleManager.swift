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
    
    private func getURL(_ rubric: Int, _ pageIndex: Int) -> URL? {
        URL(string: "https://news.myseldon.com/api/Section?rubricId=\(rubric)&pageSize=8&pageIndex=\(pageIndex)"
        )
    }
    
    // MARK: - Fetch news
    private func fetchNews() {
        guard let url = getURL(4, 1) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                var articlePage = try?
                    JSONDecoder().decode(ArticlePage.self, from: data)
                articlePage?.passTheRequestId()
                self?.Articles = (articlePage?.news)!
            }
        }.resume()
    }
}
