//
//  ViewModelType.swift
//  iDC_Project
//
//  Created by 표현수 on 2023/03/04.
//

protocol PostViewModelType {
    associatedtype Input
    associatedtype Output

    var input : Input { get }
    var output : Output { get }
}
