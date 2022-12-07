//
//  ListTask.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/07.
//

import Foundation
import SwiftUI
import Combine


struct Work : Identifiable {
    var id = String()
    var myWorkingTime : String
    var myTotalWorking : String
    var myOtTime : String
    
}

class myWorkData : ObservableObject {
    @Published var MyWorkData = [Work]()
}
