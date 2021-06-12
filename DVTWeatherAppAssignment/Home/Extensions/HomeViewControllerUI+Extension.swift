//
//  HomeViewControllerUI+Extension.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 06/06/2021.
//

import UIKit

extension HomeViewController {

    func setUpUI() {

        mainTableview.dataSource = self
        mainTableview.delegate = self
        mainTableview.backgroundView = nil
        mainTableview.backgroundColor = .clear
        
        containerViewStack.addArrangedSubview(imageView)
        containerViewStack.addArrangedSubview(mainTableview)

        containerViewStack.axis = .vertical
        containerViewStack.distribution = .fillEqually
        
        containerViewStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerViewStack)
        view.addSubview(todayWeatherInfoLabel)
        
        containerViewStack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerViewStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerViewStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerViewStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        todayWeatherInfoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.2).isActive = true
        todayWeatherInfoLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.2).isActive = true
        todayWeatherInfoLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        todayWeatherInfoLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
