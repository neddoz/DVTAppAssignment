//
//  HomeViewController+DataSource.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 06/06/2021.
//

import UIKit

extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.reuseIdentifier,
                                                           for: indexPath) as? HeaderCell,
                  let main = viewModel.columnData() else {
                return UITableViewCell()
            }
            cell.configure(with: main)
            return cell
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherBodyDetailCell.reuseIdentifier,
                                              for: indexPath) as? WeatherBodyDetailCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.result(for: indexPath.row - 1), resultItemNumber: indexPath.row + 1)
        return cell
    }
}
