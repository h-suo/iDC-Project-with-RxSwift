//
//  PostItem.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import Foundation

struct PostForm: Decodable {
    var id: Int
    var title: String
    var description: String
    var comment: [String]
    var time: String
}

let a = 0

extension PostForm {
    static let EMPTY = PostForm(id: 0, title: "title", description: "description", comment: [], time: "00:00")
}
