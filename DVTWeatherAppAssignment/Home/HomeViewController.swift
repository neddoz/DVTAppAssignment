//
//  HomeViewController.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 06/06/2021.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {

    // viewModel
    var viewModel: HomeViewModel

    let mainTableview: UITableView = {
        let view = UITableView.init(frame: .zero, style: .grouped)
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let containerViewStack: UIStackView = {
        return UIStackView()
    }()
    
    let actionContainerView: UIStackView = {
        return UIStackView()
    }()
    
    let searchButton: CenteredButton = {
        let button = CenteredButton()
        button.setImage(.init(named: "search"), for: .normal)
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(search), for: .touchUpInside)
        return button
    }()
    
    let savedSearches: CenteredButton = {
        let button = CenteredButton()
        button.setImage(.init(named: "favorite"), for: .normal)
        button.setTitle("Favourites", for: .normal)
        return button
    }()

    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let todayWeatherInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableview.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.reuseIdentifier)
        mainTableview.register(WeatherBodyDetailCell.self, forCellReuseIdentifier: WeatherBodyDetailCell.reuseIdentifier)
        setUpUI()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = HomeViewModel(mainImageView: imageView,
                                  todayWeatherLabel: todayWeatherInfoLabel,
                                  tableView: mainTableview)
        super.init(nibName: nil, bundle: nil)
        viewModel.updateBackgroundView(self.view)
    }

    init(location: CLLocationCoordinate2D) {
        viewModel = HomeViewModel.init(mainImageView: imageView,
                                       todayWeatherLabel: todayWeatherInfoLabel,
                                       tableView: mainTableview,
                                       location: location)
        super.init(nibName: nil, bundle: nil)
        viewModel.updateBackgroundView(self.view)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        actionContainerView.isHidden = viewModel.isActionContainerHidden
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    fileprivate func search() {
        AppRouter.shared.presentSearchController()
    }

    fileprivate func showFavourites() {
        
    }
}
