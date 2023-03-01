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
    
    // INPUT
    
//    let fetchPost: AnyObserver<Void>
    let writePost: AnyObserver<PostForm>
    let writeComment: AnyObserver<PostForm>
    
    // OUTPUT
    
    let errorMessage: Observable<NSError>
    let allPost: Observable<[PostForm]>
    let selectedPostIndex: Observable<Int>
    let showPostPage: Observable<PostForm>
    
    init() {
        let posts = [
            PostForm(title: "질문1", description: "A가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문2", description: "B가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문3", description: "C가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문4", description: "D가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문5", description: "E가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문6", description: "F가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문7", description: "G가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문8", description: "H가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "질문9", description: "I가 안돼요 어떻게 해야 할까요?", comment: [], time: "19:30"),
            PostForm(title: "안녕하세요. iDC 개발자입니다.", description: "iDC에 대한 설명이 부족한 것 같아 이렇게 첫 게시글을 남깁니다. \n iDC는 'iOS Developer Community'의 줄임말로 iOS 개발자들을 위한 앱입니다. \n 아이폰 앱을 개발하며 여러 사이트 들을 옮겨다니며 공부하고 구글링을 하다보니 느낀 점이 정작 앱스토어에는 iOS 개발자를 위한 커뮤니티앱이 없다는 것이었습니다. 그래서 전 저희만을 위한 앱을 만들었습니다. \n iDC는 무조건 익명 제도이며 채팅도 간단히 나누는 것을 기본으로 제작되었습니다. 모든 질문이 익명이므로 편하게 게시글을 작성하고 댓글을 작성하셔도 됩니다. 하지만 게시글과 댓글은 모두 iOS 개발과 관련된 내용만 허용하고 다른 내용은 모두 삭게하겠습니다. \n 이 앱을 누가 사용하고 몇명이나 사용할지는 모르겠지만, 마음껏 이 앱을 사용해주셨으면 합니다. \n 앱의 버그 기타 문의사항은 편하게 설정 안에 있는 개발자에게 라는 버튼을 눌러 코멘트를 남겨주시기 바랍니다. \n 감사합니다.", comment: [], time: "21:31")
        ]
        
        postObservable.onNext(posts)
        
    }
    
}
