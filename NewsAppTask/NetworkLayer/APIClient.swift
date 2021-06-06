//
//  APIClient.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 05/06/2021.
//

import Foundation
import Moya

struct APIClient {
    let baseURL: URL
    let endpoint: APIClientEndpoint
}

/// Multiple API requests
enum APIClientEndpoint {
    case basicInfo
    case hobbies
}

/// Follow the TargetType protocol and customize the request parameters
extension APIClient: TargetType {

    var path: String {
        switch endpoint {
        case .basicInfo:
            return ""
        case .hobbies:
            return ""
        }
    }

    var method: Moya.Method {
        // If necessary, it can be changed according to the endpoint
        return .get
    }

    /// Parameters required for each request
    var task: Task {
        // If the enumeration in the endpoint has an associated value, you can use the case let in the switch to retrieve the associated value
        return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
    }

    var headers: [String : String]? { nil }

    /// It is not recommended to put the test data in the Target where the App is located
    var sampleData: Data { Data() }

    /// During testing, if you need to test the status code, you need to rewrite this property.
    /// The default implementation in the TargetType protocol is to return .none, which means no statusCode verification
    var validationType: ValidationType { .successAndRedirectCodes }
}
