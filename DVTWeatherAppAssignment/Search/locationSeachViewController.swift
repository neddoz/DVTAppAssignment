//
//  File.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 12/06/2021.
//

import UIKit
import MapKit

class locationSeachViewController: UITableViewController {
    fileprivate var resultSearchController: UISearchController!
    fileprivate var matchingItems: [MKMapItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
    }
    
    private func configureSearchBar() {
        resultSearchController = UISearchController()
        resultSearchController.searchResultsUpdater = self
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for cities"
        navigationItem.titleView = resultSearchController?.searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        resultSearchController?.searchBar.setShowsCancelButton(true, animated: true)
        resultSearchController.hidesNavigationBarDuringPresentation = false
        resultSearchController.obscuresBackgroundDuringPresentation = false
    }
}

extension locationSeachViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchBarText = searchController.searchBar.text else { return }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        let search = MKLocalSearch(request: request)
        
        search.start { [weak self] response, _ in
            guard let response = response else {
                return
            }
            self?.matchingItems = response.mapItems
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension locationSeachViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedItem = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = selectedItem.name
        return cell
    }
}


extension locationSeachViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = matchingItems[indexPath.row]
        AppRouter.shared.presentSearchResult(item, from: self.navigationController, title: item.name)
    }
}
