//
//  CategoryTableViewCell.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 20/06/2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLb: UILabel!
  
    var item: CategoryModelItem? {
        didSet {
            categoryLb.text = item?.title
        }
    }

    
}
