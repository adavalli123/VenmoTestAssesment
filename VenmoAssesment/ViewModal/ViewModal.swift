//
//  ViewModal.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

class ViewModal: Response {
    var results: [AlbumResults]?
    private (set) var filteredResults: [AlbumResults]?
    private (set) var searchBarIsActive = false
    
    func handleTopAlbumsAPI(completion: @escaping (()-> ())) {
        Self.handle(url: Constants.topAlbums, decodingType: TopAlbums.self) { [weak self] (topAlbums, error) in
            guard let albums = topAlbums else { return }
            self?.results = albums.feed.results
            completion()
        }
    }
    
    func setTitle() -> String {
        return "Top Songs"
    }
    
    func filterContentForSearchText(_ searchText: String?) {
        filteredResults = findFilteredSearchResults(from: searchText)
    }
    
    private func findFilteredSearchResults(from searchText: String?) -> [AlbumResults]? {
        return results?.filter({ (result) -> Bool in
            return (result.name.lowercased().contains(searchText?.lowercased() ?? "") ||
            result.artistName.lowercased().contains(searchText?.lowercased() ?? "") ||
            result.collectionName.lowercased().contains(searchText?.lowercased() ?? ""))
        })
    }
    
    func setSearchBar(_ isActive: Bool, text: String) {
        self.searchBarIsActive = isActive && (text.isEmpty == false)
    }
}

private extension ViewModal {
    enum Constants {
        static let topAlbums = "api/v1/us/apple-music/top-songs/all/100/explicit.json"
    }
}
