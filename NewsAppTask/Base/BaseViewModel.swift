//
//  BaseViewModel.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 06/06/2021.
//

import Foundation
import RxSwift

class BaseViewModel {
    var disposeBag: DisposeBag
    init() {
        disposeBag = DisposeBag()
    }
}
