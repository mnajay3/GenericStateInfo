//
//  StateInfoTableViewCell.swift
//  USAStateInfo
//
//  Created by Naga Murala on 9/27/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import UIKit
import ProjectWorldFramework

class StateInfoTableViewCell : MasterTableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var stateName: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var area: UILabel!
    
    @IBOutlet weak var capitallargeCitiStackView: UIStackView!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var capital: UILabel!
    
    @IBOutlet weak var largecityLabel: UILabel!
    @IBOutlet weak var largeCity: UILabel!
    
    
    
    override func configureCell(item: Any, indexPath: IndexPath, cell: UITableViewCell) -> UITableViewCell {
        guard let item = item as? StateResult else { return cell }
        self.name.text           = "Name:"
        self.stateName.text      = item.name
        
        self.countryLabel.text   = "Country:"
        self.country.text        = item.country
        
        self.areaLabel.text      = "Area:"
        self.area.text           = item.area
        
        if (item.capital != nil) && !(item.capital?.isEmpty)! {
            self.capitalLabel.text = "Capital:"
            self.capital.text      = item.capital
            self.capitalLabel.isHidden = false
            self.capital.isHidden = false
            self.capitallargeCitiStackView.isHidden = false
        }else {
            self.capitalLabel.isHidden = true
            self.capital.isHidden = true
            self.capitallargeCitiStackView.isHidden = true
        }

        
        if (item.largest_city != nil) && !(item.largest_city?.isEmpty)! {
            self.largecityLabel.text = "Large City:"
            self.largeCity.text      = item.largest_city
            self.largecityLabel.isHidden = false
            self.largeCity.isHidden = false
            self.capitallargeCitiStackView.isHidden = false
        }else {
            self.largecityLabel.isHidden = true
            self.largeCity.isHidden = true
            self.capitallargeCitiStackView.isHidden = true
        }
        return cell
    }
}
