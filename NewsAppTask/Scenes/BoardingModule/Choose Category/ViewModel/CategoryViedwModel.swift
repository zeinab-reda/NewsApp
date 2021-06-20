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
    var categoriesObservable: Observable<[NewsCategory]> { get }
    func getCategories()
}

class CategoryViewModel: BaseViewModel, CategoryViewModelType {
    var categoriesObservable: Observable<[NewsCategory]>
    private let categoriesSubject = BehaviorRelay<[NewsCategory]>(value:[])

    override init() {
        categoriesObservable = categoriesSubject.asObservable()
        super.init()
    }

    func getCategories() {
        categoriesSubject.accept(categories)
    }
}

