//
//  StateInfoTableView.swift
//  USAStateInfo
//
//  Created by Naga Murala on 9/27/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//


import UIKit
import ProjectWorldFramework

class StateInfoTableView : MasterTableView {
    
    override func initialize() {
        super.initialize()
        let factory = self.cellFactory
        factory.cellCreator = createTVC
    }
    
    public func createTVC(item:Any, indexPath:IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StateInfoTableViewCell
        return cell.configureCell(item: item, indexPath: indexPath, cell: cell) as! StateInfoTableViewCell
        
    }
}
