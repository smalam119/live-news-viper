//
//  LiveNewsInterector.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import Alamofire

class LiveNewsInterector: PresentorToInterectorProtocol{

    var presenter: InterectorToPresenterProtocol?;
    
    func fetchLiveNews() {
        Alamofire.request(Constants.URL).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                self.presenter?.liveNewsFetched(news: JSON as! String);
            }
        }
    }
}
