//
//  LiveNewsInteractor.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import Alamofire

class LiveNewsInteractor: LiveNewsListPresentorToInteractorProtocol {

    // MARK: - Properties
    weak var presenter: LiveNewsListInteractorToPresenterProtocol?
    var news: [LiveNewsModel]?
    
    // MARK: - Methods
    func fetchLiveNews() {
        Alamofire.request(Constants.URL).response { response in
            if(response.response?.statusCode == 200){
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                    guard let articles = newsResponse.articles else { return }
                    self.news = articles
                    self.presenter?.liveNewsFetched()
                } catch let error {
                    print(error)
                }
            }
            else {
                self.presenter?.liveNewsFetchedFailed()
            }
        }
    }
}
