//
//  WeatherBodyDetailCell.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 06/06/2021.
//

import UIKit

enum WeatherCondition: String {
    case Rain
    case Clouds
    case Clear
    
    func text()-> String {
        switch self {
        case .Clear:
            return "Sunny"
        case .Rain:
            return "Rainy"
        case .Clouds:
            return "Cloudy"
        }
    }
    
    func icon()-> UIImage? {
        switch self {
        case .Clear:
            return .init(named: "clear")
        case .Rain:
            return .init(named: "rain")
        case .Clouds:
            return .init(named: "partlySunny")
        }
    }
    
    func color()-> UIColor? {
        switch self {
        case .Clear:
            return .sunnyColor
        case .Rain:
            return .rainyColor
        case .Clouds:
            return .cloudyColor
        }
    }
}

class WeatherBodyDetailCell: UITableViewCell {
    static let reuseIdentifier: String = "WeatherBodyDetailCell"
    
    fileprivate enum Column: Int, CaseIterable {
        case day = 0
        case image
        case temp
    }
    
    fileprivate var rowLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
    
    fileprivate lazy var firstLabel = self.rowLabel
    fileprivate lazy var secodLabel = self.rowLabel
    fileprivate lazy var iconView = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    fileprivate func setUpViews() {
        let rowStack = UIStackView(arrangedSubviews: [firstLabel, iconView, secodLabel])
        rowStack.translatesAutoresizingMaskIntoConstraints = false
        rowStack.axis = .horizontal
        rowStack.distribution = .fillEqually
        addSubview(rowStack)
        backgroundColor = .clear
        
        iconView.contentMode = .scaleAspectFit
        
        rowStack.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        rowStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        rowStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        rowStack.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
    }
    
    func configure(with result: WeatherResult, resultItemNumber: Int) {
        firstLabel.text = Date().dateFromDaysFromNow(resultItemNumber)
        secodLabel.text = String.degreesText(result.main.tempMax)
        iconView.image = WeatherCondition.init(rawValue: result.weather.first?.main ?? "")?.icon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

