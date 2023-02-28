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
    
    init(_ item: PostForm) {
        title = item.title
        description = item.description
        comment = item.comment
    }
    
    init(title: String, description: String, comment: [String]) {
        self.title = title
        self.description = description
        self.comment = comment
    }
}
