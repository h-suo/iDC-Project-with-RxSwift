//
//  HomeViewModel.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import Foundation
import RxSwift

class HomeViewModel {
    let disposeBag = DisposeBag()
    var postObservable = BehaviorSubject<[PostForm]>(value: [])
        
    
    init() {
        let menus = [
            PostForm(title: "질문1", description: "A가 안돼요 어떻게 해야 할까요?", comment: []),
            PostForm(title: "질문2", description: "B가 안돼요 어떻게 해야 할까요?", comment: []),
            PostForm(title: "질문3", description: "C가 안돼요 어떻게 해야 할까요?", comment: []),
            PostForm(title: "질문4", description: "D가 안돼요 어떻게 해야 할까요?", comment: []),
            PostForm(title: "질문5", description: "E가 안돼요 어떻게 해야 할까요?", comment: []),
            PostForm(title: "질문6", description: "F가 안돼요 어떻게 해야 할까요?", comment: []),
            PostForm(title: "질문7", description: "G가 안돼요 어떻게 해야 할까요?", comment: []),
            PostForm(title: "질문8", description: "H가 안돼요 어떻게 해야 할까요?", comment: []),
            PostForm(title: "질문9", description: "I가 안돼요 어떻게 해야 할까요?", comment: []),
        ]
        
        postObservable.onNext(menus)
    }
    
}
