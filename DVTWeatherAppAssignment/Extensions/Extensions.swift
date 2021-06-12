//
//  Extensions.swift
//  DVTWeatherAppAssignment
//
//  Created by kayeli dennis on 05/06/2021.
//

import UIKit

extension String {

    static func degreesText(_ temp: Double)-> String? {
        let measurement = Measurement(value: temp, unit: UnitTemperature.celsius)
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.unitStyle = .short
        measurementFormatter.numberFormatter.maximumFractionDigits = 0
        measurementFormatter.unitOptions = .temperatureWithoutUnit
        return measurementFormatter.string(from: measurement)
    }
}

extension Date {

    func dateFromDaysFromNow(_ daysFromNow: Int)-> String? {
        var dayComponent    = DateComponents()
        dayComponent.day    = daysFromNow
        let theCalendar     = Calendar.current
        let nextDate        = theCalendar.date(byAdding: dayComponent, to: self)
        return nextDate?.dayOfWeek()
    }

    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

extension UIColor {

    public static let sunnyColor = UIColor(red: 71/255, green: 171/255, blue: 47/255, alpha: 1)
    public static let cloudyColor = UIColor(red: 84/255, green: 113/255, blue: 122/255, alpha: 1)
    public static let rainyColor = UIColor(red: 87/255, green: 87/255, blue: 93/255, alpha: 1)
}
