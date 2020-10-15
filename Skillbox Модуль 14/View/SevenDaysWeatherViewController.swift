//
//  SevenDaysWeatherViewController.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import UIKit

class SevenDaysWeatherViewController: UIViewController, UITableViewDelegate {
    
    var weather: [SevenDaysWeather] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader = SevenDaysWeatherLoader()
        loader.delegate = self
        loader.loadWeather()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func saveWeather() {
        
        for item in weather {
            
            let day = Day()
            let days = item
            
            day.date = NSDate(timeIntervalSince1970: Double(days.dt))
            day.maxTemp = days.maxTemp
            day.minTemp = days.minTemp
            
            WeatherRealmPersistance.shared.saveDay(new: day)
            tableView.reloadData()
        }
    }
}

extension SevenDaysWeatherViewController: SevenDaysWeatherLoaderDelegate {
    func loaded(weather: [SevenDaysWeather]) {
        
        self.weather = weather
        saveWeather()
    }
}

extension SevenDaysWeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return WeatherRealmPersistance.shared.days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherTableViewCell
        
        let day = WeatherRealmPersistance.shared.days[indexPath.row]
        
        let date = day.date
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        cell.dateLabel.text = "\(formatter.string(from: date! as Date))"
        cell.tempLabel.text = "От \(Int(day.minTemp - 273)) до \(Int(day.maxTemp - 273)) °C"
        print(WeatherRealmPersistance.shared.days.count)
        return cell
    }
}
