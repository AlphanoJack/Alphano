//
//  Task.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/03.
//

import SwiftUI

// Task model and smaple Tasks
// Array of Tasks...

struct Task : Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}


//Total Task Meta View...
struct TaskMetaData : Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

//sample Date for Testing...
func getSampleDate(offset: Int) -> Date {
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

// Sample Tasks...
var tasks: [TaskMetaData] = [
    
    TaskMetaData(task: [
        
        Task(title: "Talk to iJustine"),
        Task(title: "iPhone 13 Great Design Change"),
        Task(title: "Nothing Much Workout !!!")
    ],  taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task:  [
        
        Task(title: "Talk to Jenna Ezarik")
    ],  taskDate: getSampleDate(offset: -3)),
    TaskMetaData(task:  [
        
        Task(title: "Meeting with Tim Cook")
    ],  taskDate: getSampleDate(offset: -8)),
    TaskMetaData(task:  [
        
        Task(title: "Next Version of SwiftUI")
    ],  taskDate: getSampleDate(offset: 17)),
    TaskMetaData(task:  [
        
        Task(title: "iPhone 13 Great Design Change")
    ],  taskDate: getSampleDate(offset: 15)),
    TaskMetaData(task:  [
        
        Task(title: "App Updates....")
    ],  taskDate: getSampleDate(offset: 20)),
    
]
