//
//  LiveNewsProtocols.swift
//  Live News
//
//  Created by MacBook Pro 13" on 2/4/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import UIKit

protocol LiveNewsListPresenterToViewProtocol: class {
    func showNews()
    func showError()
}

protocol LiveNewsListInteractorToPresenterProtocol: class {
    func liveNewsFetched()
    func liveNewsFetchedFailed()
}

protocol LiveNewsListPresentorToInteractorProtocol: class {
    var presenter: LiveNewsListInteractorToPresenterProtocol? { get set }
    var news: [LiveNewsModel]? { get }
    
    func fetchLiveNews()
}

protocol LiveNewsListViewToPresenterProtocol: class {
    var view: LiveNewsListPresenterToViewProtocol? { get set }
    var interactor: LiveNewsListPresentorToInteractorProtocol? { get set }
    var router: LiveNewsListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> LiveNewsModel?
}

protocol LiveNewsListPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
