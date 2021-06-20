//
//  CategoryViedwModel.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 20/06/2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol CategoryViewModelType {
    var categoriesObservable: Observable<[CategoryModelItem]> { get }
    func getCategories()
    func validateNumberofFav() -> Observable<[CategoryModelItem]>
}

class CategoryViewModel: BaseViewModel, CategoryViewModelType {
    var categoriesObservable: Observable<[CategoryModelItem]>
    private let categoriesSubject = BehaviorRelay<[CategoryModelItem]>(value:[])

    override init() {
        categoriesObservable = categoriesSubject.asObservable()
        super.init()
    }

    func getCategories() {
        var categoriesList:[CategoryModelItem] = []
        for (_,item) in categories.enumerated()
        {
            categoriesList.append(CategoryModelItem(item: item, selected: false))
        }
        categoriesSubject.accept(categoriesList)
    }
    
    func validateNumberofFav() -> Observable<[CategoryModelItem]>
    {
        
        let seq  = categoriesSubject.map {
            $0.filter { $0.selected == true }
        }.filter({ (cateogires) -> Bool in
            cateogires.count == 3
        })
        return seq
        
    }
}

