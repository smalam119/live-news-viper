//
//  LiveNewsPresenter.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation

class LiveNewsPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresentorToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchLiveNews()
    }
}

extension LiveNewsPresenter: InteractorToPresenterProtocol {
	
	func liveNewsFetched(news: LiveNewsModel) {
        view?.showNews(news: news)
    }
    
    func liveNewsFetchedFailed(){
        view?.showError()
    }
}

