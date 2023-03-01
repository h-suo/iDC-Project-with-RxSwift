//
//  PostItem.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import Foundation

struct PostForm: Decodable {
    var title: String
    var description: String
    var comment: [String]
    var time: String
}
