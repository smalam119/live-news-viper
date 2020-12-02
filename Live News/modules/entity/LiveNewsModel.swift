//
//  LiveNewsModelCodable.swift
//  Live News
//
//  Created by Sayed on 01/11/2019.
//  Copyright © 2019 pseudo0. All rights reserved.
//

import Foundation

struct LiveNewsModel: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}
