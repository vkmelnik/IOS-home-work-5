//
//  ViewController.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import UIKit

class ArticleViewController: UIViewController {
    
    var articleView: ArticleView?
    var articleManager: ArticleManager = ArticleManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "News"
        view.backgroundColor = .black
        setupArticleView()
        setupArticleManager()
    }
    
    func setupArticleView() {
        let articleView = ArticleView()
        view.addSubview(articleView)
        articleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        articleView.pinLeft(to: view)
        articleView.pinRight(to: view)
        articleView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        articleView.configure()
        articleView.tableView?.delegate = self
        articleView.tableView?.dataSource = self
        articleView.tableView?.register(ArticleCell.self, forCellReuseIdentifier: "ArticleCell")
        self.articleView = articleView
    }

    func setupArticleManager() {
        articleManager.observer = self
        DispatchQueue.global().async {
            self.articleManager.loadNews()
        }
    }
}

extension ArticleViewController: ArticleManagerObserver {
    func updateArticles() {
        DispatchQueue.main.sync {
            articleView?.tableView?.reloadData()
        }
    }
}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleManager.Articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArticleCell()
        cell.titleLabel?.text = articleManager.Articles[indexPath.row].title
        cell.descriptionLabel?.text = articleManager.Articles[indexPath.row].announce
        DispatchQueue.global().async {
            let image = self.articleManager.Articles[indexPath.row].loadImage()
            DispatchQueue.main.sync {
                cell.image?.image = image
                cell.updateUI()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webView = WebViewController()
        webView.url = articleManager.Articles[indexPath.row].articleUrl
        self.navigationController?.pushViewController(webView, animated: true)
    }
    
    private func shareArticle(article: ArticleModel?) {
        let textToShare = "This link is sent from news app for ios development homework."

        if let myWebsite = article?.articleUrl {
            let objectsToShare = [textToShare, myWebsite] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                    
            activityVC.popoverPresentationController?.sourceView = articleView
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Share") { [weak self] (action, view, completionHandler) in
            self?.shareArticle(article: self?.articleManager.Articles[indexPath.row])
                                            completionHandler(true)
        }
        action.backgroundColor = .black
        action.image = UIImage(systemName: "arrowshape.turn.up.right")
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
