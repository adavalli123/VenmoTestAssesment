//
//  AlbumResultBuilder.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation
@testable import VenmoAssesment

struct AlbumResultBuilder {
    static func build() -> [AlbumResults] {
        return [
            AlbumResults(name: "Slum Dog Millionarie",
                         collectionName: "Slum Dog Millionarie - AR Rahman",
                         artistName: "AR Rahman",
                         artworkUrl100: "www.google.com",
                         url: "www.bigcloud.com",
                         genres: [Genres(name: "Movie")],
                         copyright: "CopyRight Access"),
            AlbumResults(name: "Roja",
                         collectionName: "Roja - Andre",
                         artistName: "Andre",
                         artworkUrl100: "www.andre.com",
                         url: "www.largeCloud.com",
                         genres: [Genres(name: "Spirtual")],
                         copyright: "CopyRight Access 2")
        ]
    }
}
