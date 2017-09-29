//
//  StateViewController.swift
//  USAStateInfo
//
//  Created by Naga Murala on 9/27/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//
//This project mainly used three types of design patterns
//1. MVVM design pattern.. Here StateViewController is view(View+Controller), Model(GenericStateResponse, MessageResponse, StateResult) and the ViewModel: StateInfoInvoker (i.e. NetworkController)
//2. Singlton designpattern: All models, Service invoker uses Singlton pattern to avoid multiple objects to invoke service
//3. Delegation pattern: Very powerful mechanism used between controller, tableview and tableview cell as a communication
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
