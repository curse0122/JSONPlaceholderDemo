//
//  JSONPlaceholderPhoto.swift
//  JSONPlaceholder
//
//  Created by nier on 2021/2/20.
//

import Foundation

struct JSONPlaceholderPhoto: Codable {
    var albumId: Int?
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
