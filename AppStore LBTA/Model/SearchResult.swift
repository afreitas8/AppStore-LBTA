//
//  SearchResult.swift
//  AppStore LBTA
//
//  Created by Andrew Freitas on 1/15/20.
//  Copyright © 2020 Andrew Freitas. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable{
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
    
}
