//
//  WebViewController.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import UIKit
import WebKit

// Web view controller, that shows an article.
class WebViewController: UIViewController {
    
    var url: URL?
    private var webView: WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupWebView()
        if let url = url {
            webView?.load(URLRequest(url: url))
        }
    }
    
    private func setupWebView() {
        let webView = WKWebView()
        view.addSubview(webView)
        webView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        webView.pinLeft(to: view)
        webView.pinRight(to: view)
        webView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        self.webView = webView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
