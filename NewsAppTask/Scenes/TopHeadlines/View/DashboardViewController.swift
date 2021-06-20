//
//  DashboardViewController.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 19/06/2021.
//

import UIKit
import RxCocoa
import RxSwift
class DashboardViewController: UIViewController {
    private var viewModel: NewsViewModelType?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        
//        viewModel = NewsViewModel()
//        viewModel?.getTopHeadlines(q:"", category: NewsCategory.sports, country: NewsCountry.us, pageSize:nil, page: nil)
//        viewModel?.newsDriver.drive { (articles) in
//            debugPrint(articles.count)
//        }.disposed(by: disposeBag)
        
    }
}
