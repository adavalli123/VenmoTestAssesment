//
//  TableView.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit

class TableView: UITableView {
    var viewModal: ViewModal? {
        didSet { self.reloadData() }
    }
    
    init() {
        super.init(frame: .zero, style: .plain)
        setupTableView()
        registerTableViewCells()
        conformToDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        self.tableFooterView = UIView()
    }
    
    private func registerTableViewCells() {
        self.register(AlbumTableViewCell.self, forCellReuseIdentifier: String(describing: AlbumTableViewCell.self))
    }
    
    private func conformToDataSource() {
        self.dataSource = self
    }
}

extension TableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModal?.searchBarIsActive == true {
            return viewModal?.filteredResults?.count ?? 0
        }
        
        return viewModal?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AlbumTableViewCell.self), for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
        
        if viewModal?.searchBarIsActive == true {
            guard let result = viewModal?.filteredResults?[exist: indexPath.row] else { return cell }
            cell.configure(url: result.artworkUrl100,
                           artist: result.artistName,
                           song: result.name,
                           album: result.collectionName)
            return cell
        } else {
            guard let result = viewModal?.results?[exist: indexPath.row] else { return cell }
            cell.configure(url: result.artworkUrl100,
                           artist: result.artistName,
                           song: result.name,
                           album: result.collectionName)
            return cell
        }
    }
}



