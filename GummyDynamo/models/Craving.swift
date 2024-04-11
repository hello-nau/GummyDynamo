//
//  Craving.swift
//  GummyDynamo
//
//  Created by ヤナ on 4/10/24.
//

import Foundation

class Craving {
    var craving: String;
    
    init(craving: String) {
        self.craving = craving;
    }
    
    func getCraving() -> String {
        return craving;
    }
}
