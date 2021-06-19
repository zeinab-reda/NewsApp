//
//  DashboardViewModel.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 19/06/2021.
//

import Foundation
import RxSwift
import RxCocoa


protocol NewsViewModelType {
    var newsDriver: Driver<[Article]> { get }
    var errorDriver: Driver<String> { get }
    var loadingDriver: Driver<Bool> { get }
    func getTopHeadlines(q: String?, category: NewsCategory, country: NewsCountry, pageSize: Int?, page: Int?)
}

class NewsViewModel: BaseViewModel, NewsViewModelType {
    var newsDriver: Driver<[Article]>
    var errorDriver: Driver<String>
    var loadingDriver: Driver<Bool>

    private let newsSubject = PublishSubject<[Article]>()
    private let errorSubject = PublishSubject<String>()
    private let loadingSubject = PublishSubject<Bool>()
    private let network = NetworkManager.shared

 
    override init() {
        errorDriver = errorSubject.asDriver(onErrorJustReturn: "")
        newsDriver = newsSubject.asDriver(onErrorJustReturn: [])
        loadingDriver = loadingSubject.asDriver(onErrorJustReturn: true)

    }
  

    func getTopHeadlines(q: String?, category: NewsCategory, country: NewsCountry, pageSize: Int?, page: Int?)  {
        loadingSubject.onNext(true)
        network.getNews(q: q, category: category, country: country, pageSize: pageSize, page: page).subscribe { [weak self] news in
            if let results = news.articles  {
                self?.loadingSubject.onNext(false)
                self?.newsSubject.onNext(results)
            }
        } onError: { [weak self] error in
            self?.errorSubject.onNext(error.localizedDescription)
            self?.loadingSubject.onNext(false)
        }.disposed(by: disposeBag)
    }
}
