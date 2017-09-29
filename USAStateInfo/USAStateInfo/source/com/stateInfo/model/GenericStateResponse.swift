//
//  GenericStateResponse.swift
//  USAStateInfo
//
//  Created by Naga Murala on 9/28/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import ProjectWorldFramework

class GenericStateResponse {
    var messages: [MessageResponse]?
    var results: [StateResult]?
    init(json: JSON) {
        guard let messages = json["messages"] as? [String] else { return }
        self.messages = messages.map({ (item) -> MessageResponse in
            return MessageResponse(string: item)
        })
        
        guard let results = json["result"] as? [JSON] else { return }
        self.results = results.map({ (item) -> StateResult in
            return StateResult(json: item)!
        })
    }
}
