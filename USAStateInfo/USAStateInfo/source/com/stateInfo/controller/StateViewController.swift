//
//  StateViewController.swift
//  USAStateInfo
//
//  Created by Naga Murala on 9/27/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import UIKit
import ProjectWorldFramework

public class StateViewController : MasterViewController {
    @IBOutlet weak var stateInfoTableView: StateInfoTableView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
//        stateInfoTableView.sections = ["ProjectWorld","AJCreations"]
//        stateInfoTableView.list = [0:["HI","World","Welcome","HI","World","Welcome"], 1:["What's","Up","Dude"]]
        self.invokeService()
    }
    
    func invokeService()  {
        DispatchQueue.global().async {
            stateInfoServiceInvoker.invokeStateInfoSerive(completion: { (stateResult:[StateResult]) in
                DispatchQueue.main.async {
                    self.stateInfoTableView.list = [0:stateResult]
                    self.stateInfoTableView.sections = ["States in USA"]
                    self.stateInfoTableView.reloadData()
                }
              })
        }
    }
}
