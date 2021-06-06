//
//  ChooseCountryViewController.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 05/06/2021.
//

import UIKit

class ChooseCountryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var countryViewModel:ChooseCountryViewModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryViewModel?.getCountryList()
        
    
    }
    
    




}
