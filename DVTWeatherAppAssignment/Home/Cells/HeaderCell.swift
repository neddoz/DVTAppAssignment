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
        
        func text(from value: Int)-> String {
            let const = "\(value)"
            switch self {
            case .min:
                return const + "\n min"
            case .current:
                return const + "\n current"
            case .max:
                return const + "\n max"
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
        configure()
    }
    
    fileprivate func setUpViews() {
        let columnStack = UIStackView(arrangedSubviews: labels)
        columnStack.translatesAutoresizingMaskIntoConstraints = false
        columnStack.axis = .horizontal
        columnStack.distribution = .fillEqually
        addSubview(columnStack)
        backgroundColor = .clear
        
        columnStack.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        columnStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        columnStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        columnStack.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
    }
    
    func configure() {
        for i in 0..<labels.count {
            labels[i].text = Column(rawValue: i)?.text(from: i)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
