//
//  ChooseCountryViewModel.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 06/06/2021.
//

import Foundation
class ChooseCountryViewModel : BaseViewModel {
    
    private(set) var countriesList : [Country]? {
        didSet {

        }
    }
    override init() {
        super.init()
        self.getCountryList()
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
//        countriesList = []
        if let url = Bundle.main.url(forResource:"countries", withExtension: "plist") {
            
//            if let countriesList = NSArray(contentsOf: url) as? [String] {
//
//                for (_,item) in countriesList.enumerated()
//                {
//                    countriesList.append(Country(countryCode: item, countryName: countryName(from: item)))
//
//                }
//            }
            
        }
    
    }
}
