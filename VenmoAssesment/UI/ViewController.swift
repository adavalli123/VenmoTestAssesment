//
//  ViewController.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    var viewModal: ViewModal = ViewModal()
    let searchController = UISearchController(searchResultsController: nil)
    
    let tableView = TableView()
    
    override func loadView() {
        super.loadView()
        loadViewSetup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupSearchController()
    }

    private func addTableViewToSuperView() {
        self.view.addSubview(tableView)
        tableView.addConstaintsToSuperview()
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search with artist, song or album here..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func loadViewSetup() {
        view.backgroundColor = .white
        tableView.delegate = self
        addTableViewToSuperView()
    }
    
    func setup() {
        title = viewModal.setTitle()
        viewModal.handleTopAlbumsAPI { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.viewModal = self?.viewModal
            }
        }
    }
    
    func getDetailVC(from indexPath: Int) -> DetailViewController? {
        if let filteredResult = self.viewModal.filteredResults?[exist: indexPath],
            self.viewModal.searchBarIsActive == true {
            return DetailViewController(result: filteredResult)
        }

        if let result = self.viewModal.results?[exist: indexPath] {
            return DetailViewController(result: result)
        }
        
        return nil
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = getDetailVC(from: indexPath.row) else { return }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModal.filterContentForSearchText(searchBar.text)
        viewModal.setSearchBar(searchController.isActive, text: searchBar.text ?? "")
        self.tableView.viewModal = viewModal
    }
}

