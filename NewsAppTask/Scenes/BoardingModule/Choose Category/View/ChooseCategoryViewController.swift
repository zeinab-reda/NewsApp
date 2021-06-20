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
    @IBOutlet weak var nextBtn: UIBarButtonItem!
    private let cellIdentifer = "CategoryTableViewCell"
    private let disposeBag = DisposeBag()
    private var viewModel:CategoryViewModelType?
    private var favCats:[String] = []
    
    override func viewDidLoad() {
        viewModel = CategoryViewModel()
        viewModel?.getCategories()
        setupTableView()
        viewModel?.validateNumberofFav().subscribe(onNext: { (elements) in
            for (_,item) in elements.enumerated(){
                print(item.title)
            }
        }).disposed(by: disposeBag)
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
            cell.accessoryType = (cell.item?.selected ?? false) ? .checkmark : .none

        }.disposed(by: disposeBag)
        
        
        // set selected model item
        tableView.rx.modelSelected(CategoryModelItem.self).subscribe { item in
            item.element?.selected = true
        }.disposed(by: disposeBag)
        
        // set unselected model item
        tableView.rx.modelDeleted(CategoryModelItem.self).subscribe { item in
            item.element?.selected = false
        }.disposed(by: disposeBag)
        
        
        
        // did select item
        tableView.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
            let cell = self?.tableView.cellForRow(at: indexPath) as? CategoryTableViewCell
            cell?.accessoryType =  .checkmark
          }).disposed(by: disposeBag)
        
        
        // un select item
        tableView.rx.itemDeselected.subscribe(onNext: { [weak self] indexPath in
            let cell = self?.tableView.cellForRow(at: indexPath) as? CategoryTableViewCell
            cell?.accessoryType = .none
        }).disposed(by: disposeBag)
        
    }
   
    @IBAction func nextBtnAction(_ sender: Any) {
    }
    
    
}
