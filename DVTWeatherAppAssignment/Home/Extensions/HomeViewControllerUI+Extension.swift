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
        
        actionContainerView.addArrangedSubview(searchButton)
        actionContainerView.addArrangedSubview(savedSearches)

        containerViewStack.axis = .vertical
        containerViewStack.distribution = .fillEqually
        
        actionContainerView.axis = .horizontal
        actionContainerView.distribution = .fillEqually

        containerViewStack.translatesAutoresizingMaskIntoConstraints = false
        actionContainerView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(containerViewStack)
        view.addSubview(todayWeatherInfoLabel)
        view.addSubview(actionContainerView)
        
        containerViewStack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerViewStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerViewStack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerViewStack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        todayWeatherInfoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.2).isActive = true
        todayWeatherInfoLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.2).isActive = true
        todayWeatherInfoLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        todayWeatherInfoLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        actionContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        actionContainerView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05).isActive = true
        actionContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        actionContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
