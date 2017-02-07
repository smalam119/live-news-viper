//
//  LiveNewsInterector.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class LiveNewsInterector: PresentorToInterectorProtocol{

    var presenter: InterectorToPresenterProtocol?;
    
    func fetchLiveNews() {
        Alamofire.request(Constants.URL).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as! AnyObject? {
                    let arrayResponse = json["articles"] as! NSArray
                    let arrayObject = Mapper<LiveNewsModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.liveNewsFetched(news: (arrayObject?[0])!);
                }
            }
            else {
                self.presenter?.liveNewsFetchedFailed();
            }
        }
    }
}
