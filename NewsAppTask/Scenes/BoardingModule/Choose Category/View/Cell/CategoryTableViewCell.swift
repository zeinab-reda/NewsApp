//
//  CategoryTableViewCell.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 20/06/2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLb: UILabel!
    var item: NewsCategory? {
        didSet {
            categoryLb.text = item?.rawValue
        }
    }

    
}
