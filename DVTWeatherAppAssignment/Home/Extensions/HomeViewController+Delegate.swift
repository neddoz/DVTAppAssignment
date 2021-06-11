//
//  HomeViewController+Delegate.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 06/06/2021.
//

import UIKit

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        }
        return 45
    }
}
