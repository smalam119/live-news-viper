//
//  LiveNewsPresenter.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation

class LiveNewsPresenter: LiveNewsListViewToPresenterProtocol {
    
    weak var view: LiveNewsListPresenterToViewProtocol?
    var interactor: LiveNewsListPresentorToInteractorProtocol?
    var router: LiveNewsListPresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchLiveNews()
    }
}

extension LiveNewsPresenter: LiveNewsListInteractorToPresenterProtocol {
	
	func liveNewsFetched(news: [LiveNewsModel]) {
        view?.showNews(news: news)
    }
    
    func liveNewsFetchedFailed() {
        view?.showError()
    }
}

