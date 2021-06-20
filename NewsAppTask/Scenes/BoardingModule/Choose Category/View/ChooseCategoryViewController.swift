//
//  ChooseCategoryViewController.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 20/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class ChooseCategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let cellIdentifer = "CategoryTableViewCell"
    private let disposeBag = DisposeBag()
    private var viewModel:CategoryViewModelType?
    
    override func viewDidLoad() {
        viewModel = CategoryViewModel()
        viewModel?.getCategories()
        setupTableView()
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
  
    private func setupTableView()
    {
        // register cell
        tableView.register(UINib(nibName: cellIdentifer, bundle: nil),
                           forCellReuseIdentifier: cellIdentifer)
        
        tableView.rowHeight = 44.0
        // binding table
        
        viewModel?.categoriesObservable.bind(to: tableView.rx.items(cellIdentifier: cellIdentifer,
                                                                    cellType: CategoryTableViewCell.self)) { (_, item, cell) in
            cell.item = item
        }.disposed(by: disposeBag)
        
        
        
        // did select item
        tableView.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
            
        
            let cell = self?.tableView.cellForRow(at: indexPath) as? CountryTableViewCell
            cell?.accessoryType = .checkmark
            
//            self?.navigate(MyNavigation.dashboard)
//            self?.navigationController?.present(DashboardViewController(), animated: true, completion: nil)

          }).disposed(by: disposeBag)
        
    }
   
    
}
