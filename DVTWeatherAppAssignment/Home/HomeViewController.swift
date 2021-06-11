//
//  HomeViewController.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 06/06/2021.
//

import UIKit

class HomeViewController: UIViewController {

    // viewModel
    var viewModel: HomeViewModel

    let mainTableview: UITableView = {
        let view = UITableView.init(frame: .zero, style: .grouped)
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = .init(named: "sea_sunny")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let todayWeatherInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "SomeText"
        label.textAlignment = .center
        label.textColor = .white
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
        viewModel = HomeViewModel(mainImageView: imageView, todayWeatherLabel: todayWeatherInfoLabel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
