//
//  APIClient.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 05/06/2021.
//

import Foundation
import Moya


/// Multiple API requests
enum APIClientEndpoint {
    case topHeadlines(q: String?, category: NewsCategory, country: NewsCountry, pageSize: Int?, page: Int?)
}

/// Follow the TargetType protocol and customize the request parameters
extension APIClientEndpoint: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string:K.ProductionServer.baseApiURL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .topHeadlines( _, _, _, _, _):
            return "v2/top-headlines"
  
        }
    }
    
    var method: Moya.Method {
        // If necessary, it can be changed according to the endpoint
        return .get
    }
    
    /// Parameters required for each request
    var task: Task {
        // If the enumeration in the endpoint has an associated value, you can use the case let in the switch to retrieve the associated value

        switch self {
        case .topHeadlines(let searchtxt,let  cat,let country,let pageSize,let page):
            let params = makeTopHeadlinesParameters(q: searchtxt, category: cat, country: country, pageSize: pageSize, page: page)
            return .requestParameters(parameters: params, encoding: URLEncoding.default)

        }
    }
    
    var headers: [String : String]? { ["Content-type": "application/json"] }
    
    /// It is not recommended to put the test data in the Target where the App is located
    var sampleData: Data { Data() }
    
    /// During testing, if you need to test the status code, you need to rewrite this property.
    /// The default implementation in the TargetType protocol is to return .none, which means no statusCode verification
    var validationType: ValidationType { .successAndRedirectCodes }
    

}

private extension APIClientEndpoint {
 
  
    
    func makeTopHeadlinesParameters(q: String?, category: NewsCategory, country: NewsCountry, pageSize: Int?, page: Int?) -> [String: String] {
        var parameters = [String: String]()
        
        parameters["apiKey"] = K.ProductionServer.apiKey
        
        if let q = q {
            parameters["q"] = q
        }
        
       
        
        if let pageSize = pageSize {
            parameters["pageSize"] = String(pageSize)
        }
        
        if let page = page {
            parameters["page"] = String(page)
        }
        
        if case .all = category {} else {
            parameters["category"] = category.rawValue
        }
      
        
        if case .all = country {} else {
            parameters["country"] = country.rawValue
        }
        
        
        return parameters
    }
}
