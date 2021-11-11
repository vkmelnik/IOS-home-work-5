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
        tableView?.rowHeight = 300
        addSubview(tableView!)
        tableView?.pin(to: self)
        
        backgroundColor = .black
        tableView?.backgroundColor = .black
    }

}
