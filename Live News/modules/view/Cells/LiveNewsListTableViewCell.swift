//
//  LiveNewsTableViewCell.swift
//  Live News
//
//  Created by Sayed Mahmudul Alam on 12/2/20.
//  Copyright © 2020 pseudo0. All rights reserved.
//

import UIKit

class LiveNewsListTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK:- Methods
    func setCell(title: String, author: String, description: String) {
        titleLabel.text = title
        authorLabel.text = author
        descriptionLabel.text = description
    }
    
}
