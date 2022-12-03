//
//  DateValue.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/02.
//

import Foundation

//Date Value Model...

struct DateValue : Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
    
}
