//
//  LiveNewsRouter.swift
//  Live News
//
//  Created by Anirudha Mahale on 31/07/18.
//  Copyright © 2018 pseudo0. All rights reserved.
//

import Foundation
import UIKit

class LiveNewsRouter: PresenterToRouterProtocol{
    
    class func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "LiveNewsViewController") as? LiveNewsViewController;
        
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = LiveNewsPresenter();
        let interactor: PresentorToInterectorProtocol = LiveNewsInterector();
        let router: PresenterToRouterProtocol = LiveNewsRouter();
        
        view?.presenter = presenter;
        presenter.view = view;
        presenter.router = router;
        presenter.interector = interactor;
        interactor.presenter = presenter;
        
        return view!;
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main", bundle: Bundle.main)
    }
}
