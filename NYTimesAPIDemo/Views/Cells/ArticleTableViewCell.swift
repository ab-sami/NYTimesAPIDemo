//
//  ArticleTableViewCell.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 18/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: CustomImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        articleImageView.layer.cornerRadius = articleImageView.frame.height/2;
    }
}
