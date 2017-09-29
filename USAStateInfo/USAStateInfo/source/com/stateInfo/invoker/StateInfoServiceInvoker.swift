//
//  StateInfoServiceInvoker.swift
//  USAStateInfo
//
//  Created by Naga Murala on 9/28/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import ProjectWorldFramework

public var stateInfoServiceInvoker : StateInfoServiceInvoker {
    return StateInfoServiceInvoker.sharedInstance
}

public class StateInfoServiceInvoker : MasterTaskManagementDelegate {
    
    fileprivate static var sharedInstance = StateInfoServiceInvoker()
    
    private init(){
        
    }
    public func invokeStateInfoSerive(completion: @escaping ([StateResult])->()) {
        masterTaskMgmt.performTask(delegate:self, block: {
            print("Do actions immediate after the service response")
        }) { (data) in
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! JSON
                let stateInfoResponse = GenericStateResponse(json: json["RestResponse"] as! JSON)
                guard let populatedResponse = stateInfoResponse.results else { return }
                completion(populatedResponse)
                for stateInfo in stateInfoResponse.results! {
                    print(stateInfo.toString())
                    print()
                }
            } catch {
                print(error)
            }
            }
        }
    
    public func prepareServiceURL() -> URL? {
        let urlString = "http://services.groupkt.com/state/get/USA/all"
        let url = URL(string: urlString)
        return url! as URL
    }
}
