//
//  LiveNewsPresenter.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation

class LiveNewsPresenter: LiveNewsListViewToPresenterProtocol {
    
    // MARK: - Properties
    weak var view: LiveNewsListPresenterToViewProtocol?
    var interactor: LiveNewsListPresentorToInteractorProtocol?
    var router: LiveNewsListPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchLiveNews()
    }
    
    func getNewsListCount() -> Int? {
        return interactor?.news?.count
    }
    
    func getNews(index: Int) -> LiveNewsModel? {
        return interactor?.news?[index]
    }
}

// MARK: - LiveNewsListInteractorToPresenterProtocol
extension LiveNewsPresenter: LiveNewsListInteractorToPresenterProtocol {
	
	func liveNewsFetched() {
        view?.showNews()
    }
    
    func liveNewsFetchedFailed() {
        view?.showError()
    }
}

