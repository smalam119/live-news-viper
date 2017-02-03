//
//  LiveNewsModel.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import Foundation
import ObjectMapper

private let KEY_AUTHOR = "author";
private let KEY_TITLE = "title";
private let KEY_DESCRIPTION = "description";
private let KEY_URL = "url";
private let KEY_URLTOIMAGE = "urltoimage";
private let KEY_PUBLISHED_AT = "publishedAt";


class LiveNewsModel: Mappable{
    internal var author: String?;
    internal var title: String?;
    internal var description: String?;
    internal var url: String?;
    internal var urlToImage: String?;
    internal var publishedAt: String?
    
    required init?(map: Map) {
        mapping(map: map);
    }
    
    func mapping(map: Map) {
        author <- map[KEY_AUTHOR];
        title <- map[KEY_TITLE];
        description <- map[KEY_DESCRIPTION];
        url <- map[KEY_URL];
        urlToImage <- map[KEY_URLTOIMAGE];
        publishedAt <- map[KEY_PUBLISHED_AT];
    }
    
}
