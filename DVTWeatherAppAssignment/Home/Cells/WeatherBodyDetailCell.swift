//
//  WeatherBodyDetailCell.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 06/06/2021.
//

import UIKit

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
        label.text = "SomeText"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
    
    fileprivate lazy var labels: [UILabel] = Column.allCases.map { _ in return rowLabel }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        configure()
    }
    
    fileprivate func setUpViews() {
        let rowStack = UIStackView(arrangedSubviews: labels)
        rowStack.translatesAutoresizingMaskIntoConstraints = false
        rowStack.axis = .horizontal
        rowStack.distribution = .fillEqually
        addSubview(rowStack)
        backgroundColor = .clear
        
        rowStack.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        rowStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        rowStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        rowStack.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
    }
    
    func configure() {
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

