//
//  TopAlbums.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

struct TopAlbums: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [AlbumResults]
}

struct AlbumResults: Decodable {
    let name: String
    let collectionName: String
    let artistName: String
    let artworkUrl100: String
    let url: String
    let genres: [Genres]
    let copyright: String
}

struct Genres: Decodable {
    let name: String
}
