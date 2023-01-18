//
//  ListTask.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/07.
//

import Foundation
import SwiftUI



struct Work : Identifiable {
    var id = String()
    var myWorkingTime : String
    var myTotalWorking : String
    var myOtTime : String
    
}

class myWorkData : ObservableObject {
    @Published var MyWorkData = [Work]()
}

//class userHwage : ObservableObject {
//    @Published var UserHwage : String
//    
//    init() {
//        let defaults = UserDefaults.standard
//        hWage = defaults.string(forKey: "userWage_Key")
//    }
//}


