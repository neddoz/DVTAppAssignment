//
//  HeaderCell.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 06/06/2021.
//

import UIKit

class HeaderCell: UITableViewCell {
    static let reuseIdentifier: String = "HeaderCell"
    
    fileprivate enum Column: Int, CaseIterable {
        case min = 0
        case current
        case max
        
        func text(from value: String)-> String {
            switch self {
            case .min:
                return value + "\n min"
            case .current:
                return value + "\n current"
            case .max:
                return value + "\n max"
            }
        }
    }
    
    fileprivate var columnLabel: UILabel {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    fileprivate lazy var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    fileprivate lazy var labels: [UILabel] = {
        var labels = [UILabel]()
        Column.allCases.forEach { _ in
            labels.append(columnLabel)
        }
        return labels
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    fileprivate func setUpViews() {
        let columnStack = UIStackView(arrangedSubviews: labels)
        columnStack.translatesAutoresizingMaskIntoConstraints = false
        columnStack.axis = .horizontal
        columnStack.distribution = .fillEqually
        addSubview(columnStack)
        backgroundColor = .clear
        
        addSubview(dividerView)

        columnStack.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        columnStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        columnStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        columnStack.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true

        dividerView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        dividerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        dividerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        dividerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
    }

    func configure(with weather: Main) {
        for i in 0..<labels.count {
            var temp: Double = weather.temp
            guard let col = Column(rawValue: i) else {return}
            
            if col == .min {
                temp = weather.tempMin
            } else if col == .max {
                temp = weather.tempMax
            }
            
            if let text = String.degreesText(temp) {
                labels[i].text = col.text(from: text)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
