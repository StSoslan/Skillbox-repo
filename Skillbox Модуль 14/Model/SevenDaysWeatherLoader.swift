//
//  SevenDaysWeatherLoader.swift
//  Skillbox Модуль 14
//
//  Created by Сослан Меладзе on 12.10.2020.
//

import Foundation

protocol SevenDaysWeatherLoaderDelegate {
    func loaded(weather: [SevenDaysWeather])
}

class SevenDaysWeatherLoader {
    
    var delegate: SevenDaysWeatherLoaderDelegate?
    
    func loadWeather(){
         let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=55.7522200&lon=37.6155600&exclude=&appid=8a818cd5b3738ea0f8582624dd90c350")!
         let request = URLRequest(url: url)
         let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
         if let data = data,
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
            let jsonDict = json as? NSDictionary,
            let daily = jsonDict["daily"] as? NSArray{
         
            var weather: [SevenDaysWeather] = []
            
            for data in daily {
                if let weathers = SevenDaysWeather(data: data as! NSDictionary)
                { weather.append(weathers)}
            }
            
            DispatchQueue.main.async {
            self.delegate?.loaded(weather: weather)
            }
            
            }
        }
        
        task.resume()
    }
}
