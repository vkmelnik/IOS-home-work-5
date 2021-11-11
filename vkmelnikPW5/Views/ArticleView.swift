//
//  ArticleView.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import UIKit

// View that displays articles.
class ArticleView: UIView {

    var tableView: UITableView?
    
    func configure(){
        tableView = UITableView()
        tableView?.backgroundColor = .yellow
        addSubview(tableView!)
        tableView?.pin(to: self)
    }

}
