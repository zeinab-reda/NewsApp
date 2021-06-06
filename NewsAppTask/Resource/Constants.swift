//
//  Constant.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 05/06/2021.
//

import Foundation
struct K {
    struct ProductionServer {
        static let baseApiURL = "https://newsapi.org/"
        static let apiKey = "a9860808253d46e1b686dbc7ed9aa9bd"
    }
    struct StoryBoard
    {
        static let mainSB = "Main"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
enum ContentType: String {
    case json = "application/json"
    case form = "application/x-www-form-urlencoded"
    
}
