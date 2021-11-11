//
//  ArticleCell.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import UIKit

// Cell that shows preview of a news article.
class ArticleCell: UITableViewCell {
    
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    var image: UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCell() {
        let titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.pinTop(to: self)
        titleLabel.pinLeft(to: self)
        titleLabel.setHeight(to: 20)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        let descriptionLabel = UILabel()
        self.addSubview(descriptionLabel)
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor)
        descriptionLabel.pinLeft(to: self)
        descriptionLabel.setHeight(to: 20)
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        
        let image = UIImageView()
        self.addSubview(image)
        image.pinTop(to: descriptionLabel.bottomAnchor)
        image.pinBottom(to: self.bottomAnchor)
        image.pinLeft(to: self)
        image.pinRight(to: self)
        image.contentMode = .scaleAspectFit
        
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
        self.image = image
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
