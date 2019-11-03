//
//  LiveNewsInteractor.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import Alamofire

class LiveNewsInteractor: PresentorToInteractorProtocol{

    var presenter: InteractorToPresenterProtocol?
    
    func fetchLiveNews() {
        Alamofire.request(Constants.URL).response { response in
            if(response.response?.statusCode == 200){
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                    guard let firstArticle = newsResponse.articles?[0] else {
                        return
                    }
                    self.presenter?.liveNewsFetched(news: firstArticle)
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
