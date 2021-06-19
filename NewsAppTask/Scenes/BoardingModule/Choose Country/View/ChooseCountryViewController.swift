//
//  ChooseCountryViewController.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 05/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class ChooseCountryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel:CountryViewModel?
    private let cellIdentifer = "CountryTableViewCell"
    private let disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CountryViewModel()
        setupTableView()
        
    }
    
    private func setupTableView()
    {
        // register cell
        tableView.register(UINib(nibName: cellIdentifer, bundle: nil),
                           forCellReuseIdentifier: cellIdentifer)
        // binding table
        viewModel?.countriesDriver.drive(tableView.rx.items(cellIdentifier: cellIdentifer,
                                                      cellType: CountryTableViewCell.self)) { _, element, cell in
            cell.item = element
            
        }.disposed(by: disposeBag)
        
        //list countries
        viewModel?.getCountryList()

        tableView.rx.modelSelected(Country.self).subscribe { [weak self] topic in
            
        }.disposed(by: disposeBag)
    }
    
  

    
    
}
