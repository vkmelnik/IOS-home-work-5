//
//  ViewController.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import UIKit

class ArticleViewController: UIViewController {
    
    var articleView: ArticleView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupArticleView()
    }
    
    func setupArticleView() {
        let articleView = ArticleView()
        view.addSubview(articleView)
        articleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        articleView.pinLeft(to: view)
        articleView.pinRight(to: view)
        articleView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        articleView.configure()
        self.articleView = articleView
    }


}
