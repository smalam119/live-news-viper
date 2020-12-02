//
//  LiveNewsRouter.swift
//  Live News
//
//  Created by MacBook Pro 13" on 2/4/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import UIKit

class LiveNewsRouter: LiveNewsListPresenterToRouterProtocol{
    
    // MARK: - Methods
    
    class func createModule() -> UIViewController {
        
        let view = LiveNewsListViewController()
        let presenter: LiveNewsListViewToPresenterProtocol & LiveNewsListInteractorToPresenterProtocol = LiveNewsPresenter()
        let interactor: LiveNewsListPresentorToInteractorProtocol = LiveNewsInteractor()
        let router: LiveNewsListPresenterToRouterProtocol = LiveNewsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
