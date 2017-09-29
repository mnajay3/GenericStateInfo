//
//  StateResult.swift
//  USAStateInfo
//
//  Created by Naga Murala on 9/28/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import ProjectWorldFramework

public class StateResult {
    var area : String?
    var name : String?
    var abbr : String?
    var largest_city : String?
    var capital : String?
    var country : String?
    
    init?(json: JSON) {
        self.area = mapJSONValue(json: json, key: "area").toMiles()
        
        self.name = mapJSONValue(json: json, key: "name")
        
        self.abbr = mapJSONValue(json: json, key: "abbr")

        self.largest_city = mapJSONValue(json: json, key: "largest_city")

        self.capital = mapJSONValue(json: json, key: "capital")

        self.country = mapJSONValue(json: json, key: "country")
    }
    
    public func mapJSONValue(json: JSON, key: String) -> String {
        guard let value =  json[key] as? String else { return "" }
        return value
    }
    public func toString() -> String {
        return "State Name: \(self.name), area: \(self.area), abbrevation: \(self.abbr), largest City: \(self.largest_city), State capital: \(self.capital), Country Name: \(self.country)"
    }
}
