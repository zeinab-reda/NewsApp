//
//  Country.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 06/06/2021.
//

import Foundation

class Country
{
    // MARK:- Variable
    private var countryCode: String

    /// Name of the country
    private var countryName: String
    
    init()
    {
        countryCode = ""
        countryName = ""
    }
    init(countryCode:String ,countryName:String ) {
        self.countryCode = countryCode
        self.countryName = countryName
    }
    
  
}
