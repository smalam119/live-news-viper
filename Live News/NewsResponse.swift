//
//  NewsResponse.swift
//  Live News
//
//  Created by Sayed on 01/11/2019.
//  Copyright © 2019 pseudo0. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    let status: String?
    let source: String?
    let sortBy: String?
    let articles: [LiveNewsModel]?
}


