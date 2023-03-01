//
//  ViewPost.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import Foundation

struct ViewPost {
    
    var title: String
    var description: String
    var comment: [String]
    var time: String
    
    init(_ item: PostForm) {
        title = item.title
        description = item.description
        comment = item.comment
        time = item.time
    }
    
    init(title: String, description: String, comment: [String], time: String) {
        self.title = title
        self.description = description
        self.comment = comment
        self.time = time
    }
}
