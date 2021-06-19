//
//  CountryTableViewCell.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 19/06/2021.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet private var countryNameLb: UILabel!
    
    var item: Country? {
        didSet {
            countryNameLb.text = item?.countryName
        }
    }
    
}
