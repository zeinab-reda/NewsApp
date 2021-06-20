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
    private var lastSelection: IndexPath!
    
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
        tableView.rowHeight = 44.0
        // binding table
        viewModel?.countriesDriver.drive(tableView.rx.items(cellIdentifier: cellIdentifer,
                                                      cellType: CountryTableViewCell.self)) { _, element, cell in
            cell.item = element
            
        }.disposed(by: disposeBag)
        
        //list countries
        viewModel?.getCountryList()

        // set selected model item
        
        tableView.rx.modelSelected(Country.self).subscribe { item in
            Helper.saveUserDefault(key: K.Keys.country.rawValue, value: item.element?.countryCode ?? "")
        }.disposed(by: disposeBag)
        
        
        // did select item
        tableView.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
            
            if self?.lastSelection != nil {
                let cell = self?.tableView.cellForRow(at: self?.lastSelection ?? IndexPath(row: 0, section: 0)) as? CountryTableViewCell
                cell?.accessoryType = .none
                
            }
            self?.lastSelection = indexPath
            
            let cell = self?.tableView.cellForRow(at: indexPath) as? CountryTableViewCell
            cell?.accessoryType = .checkmark


          }).disposed(by: disposeBag)
    }
    
  

    
    
}
