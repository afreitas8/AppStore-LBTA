//
//  AppGroup.swift
//  AppStore LBTA
//
//  Created by Andrew Freitas on 2/6/20.
//  Copyright © 2020 Andrew Freitas. All rights reserved.
//

import Foundation

struct AppGroup: Decodable{
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable{
    let name, artistName, artworkUrl100: String
    
}
