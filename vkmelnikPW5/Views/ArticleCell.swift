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
    var previewView: UIView?
    var labelsView: UIView?
    var image: UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupCell() {
        let previewView = UIView()
        self.backgroundColor = .clear
        previewView.backgroundColor = .black
        previewView.layer.cornerRadius = 10
        previewView.layer.masksToBounds = true
        self.addSubview(previewView)
        previewView.pinTop(to: self, 10)
        previewView.pinBottom(to: self, 10)
        previewView.pinLeft(to: self, 10)
        previewView.pinRight(to: self, 10)
        self.previewView = previewView
        
        setupLabels()
        setupImage()
        selectionStyle = .none
    }
    
    private func setupLabels() {
        let labelsView = UIView()
        previewView?.addSubview(labelsView)
        labelsView.backgroundColor = .darkGray
        labelsView.pinBottom(to: previewView!)
        labelsView.pinLeft(to: previewView!)
        labelsView.pinRight(to: previewView!)
        labelsView.setHeight(to: 100)
        self.labelsView = labelsView
        
        let titleLabel = UILabel()
        labelsView.addSubview(titleLabel)
        titleLabel.pinTop(to: labelsView, 10)
        titleLabel.pinLeft(to: labelsView, 10)
        titleLabel.pinRight(to: labelsView, 10)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        titleLabel.textColor = .white
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        let descriptionLabel = UILabel()
        labelsView.addSubview(descriptionLabel)
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor)
        descriptionLabel.pinLeft(to: labelsView, 10)
        descriptionLabel.pinBottom(to: labelsView, 10)
        descriptionLabel.pinRight(to: labelsView, 10)
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .white
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
    }
    
    private func setupImage() {
        let image = UIImageView()
        previewView!.addSubview(image)
        image.pinTop(to: previewView!)
        image.pinBottom(to: labelsView!.topAnchor)
        image.pinLeft(to: previewView!)
        image.pinRight(to: previewView!)
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        self.image = image
    }
    
    func updateUI() {
        labelsView?.backgroundColor = image?.image?.areaAverage()
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
