//
//  HomeViewModel.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/02/28.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    static let shared = HomeViewModel()
    
    let disposeBag = DisposeBag()
    
    var postObservable = BehaviorSubject<[PostForm]>(value: [])
//    var writePost: PublishSubject<String> = PublishSubject()
    
    
    /*// INPUT
     
     let fetchPost: AnyObserver<Void>
     let writePost: AnyObserver<PostForm>
     let writeComment: AnyObserver<PostForm>
     
     // OUTPUT
     
     let errorMessage: Observable<NSError>
     let allPost: Observable<[PostForm]>
     let selectedPostIndex: Observable<Int>
     let showPostPage: Observable<PostForm>  */
    
    init() {
        var posts = [
            PostForm(title: "질문1", description: "A가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문2", description: "B가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문3", description: "C가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문4", description: "D가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문5", description: "E가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문6", description: "F가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문7", description: "G가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문8", description: "H가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문9", description: "I가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
        ]
        
        postObservable.onNext(posts)
    }
    
    func writePost(title: String, description: String, time: String) {
        _ = postObservable
            .map({ posts in
                var postList = posts
                let newPost = PostForm(title: title, description: description, comment: [], time: time)
                postList.append(newPost)
                return postList
            })
            .take(1)
            .subscribe(onNext: {
                self.postObservable.onNext($0)
            })
    }
}
