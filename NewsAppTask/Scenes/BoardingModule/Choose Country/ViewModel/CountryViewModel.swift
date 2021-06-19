//
//  ChooseCountryViewModel.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 06/06/2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol CountriesViewModelType {
    var countriesDriver: Driver<[Country]> { get }
    func getCountryList()
}

class CountryViewModel : BaseViewModel ,CountriesViewModelType {
    
    var countriesDriver: Driver<[Country]>
    private let countriesSubject = PublishSubject<[Country]>()


    override init() {
        countriesDriver = countriesSubject.asDriver(onErrorJustReturn: [])
        super.init()
    }
    
    func countryName(from countryCode: String) -> String {
        if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
            // Country name was found
            return name
        } else {
            // Country name cannot be found
            return countryCode
        }
    }
    
    
    func getCountryList()
    {
        var countries:[Country] = []
        if let url = Bundle.main.url(forResource:"countries", withExtension: "plist") {
            
            if let countriesList = NSArray(contentsOf: url) as? [String] {

                
                for (_,item) in countriesList.enumerated()
                {
                    countries.append(Country(countryCode: item, countryName: countryName(from: item)))

                }
            }
            self.countriesSubject.onNext(countries)
        }
    
    }
}
