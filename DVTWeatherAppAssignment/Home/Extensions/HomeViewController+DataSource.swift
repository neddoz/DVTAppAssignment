//
//  HomeViewController+DataSource.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 06/06/2021.
//

import UIKit

extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.reuseIdentifier,
                                                  for: indexPath) as? HeaderCell else {
                return UITableViewCell()
            }
            return cell
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherBodyDetailCell.reuseIdentifier,
                                              for: indexPath) as? WeatherBodyDetailCell else {
            return UITableViewCell()
        }
        return cell
    }
}
