//
//  JSONPlaceholderApi.swift
//  JSONPlaceholder
//
//  Created by nier on 2021/2/20.
//

import Foundation

enum JSONPlaceholderApi: String {
    case photos = "/photos"
    
    var api: String {
        let baseURL = "https://jsonplaceholder.typicode.com"
        return baseURL + self.rawValue
    }
}
