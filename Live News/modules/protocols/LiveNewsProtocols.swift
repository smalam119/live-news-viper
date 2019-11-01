//
//  LiveNewsProtocols.swift
//  Live News
//
//  Created by MacBook Pro 13" on 2/4/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewProtocol: class {
    func showNews(news: LiveNewsModel)
    func showError()
}

protocol InteractorToPresenterProtocol: class {
    func liveNewsFetched(news: LiveNewsModel)
    func liveNewsFetchedFailed()
}

protocol PresentorToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchLiveNews()
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresentorToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
