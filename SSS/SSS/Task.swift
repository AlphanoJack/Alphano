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
//    var dayHwage : String
//    var dayWokrTime : String
//    var dayOTTime : String
//    var dayNightWorkTime : String
}


//class TaskC : Identifiable {
//
//
//
//    var id = UUID().uuidString
//    var title: String
//    var time: Date = Date()
//    var dayHwage : String
//    var dayWokrTime : String
//    var dayOTTime : String
//    var dayNightWorkTime : String
//
//    init(id: String = UUID().uuidString, title: String, time: Date, dayHwage: String, dayWokrTime: String, dayOTTime: String, dayNightWorkTime: String) {
//        self.id = id
//        self.title = title
//        self.time = time
//        self.dayHwage = dayHwage
//        self.dayWokrTime = dayWokrTime
//        self.dayOTTime = dayOTTime
//        self.dayNightWorkTime = dayNightWorkTime
//    }
//
//}

//class TaskClone : Identifiable {
//    var name : String
//    var age : String
//
//
//    init(_ name1 : String, _ age2: String) {
//        self.name = name1
//        self.age = age2
//    }
//}

//class TaskData : ObservableObject {
//    @Published
//}

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
var tasks: [TaskMetaData] =
    

[
    
    TaskMetaData(task: [
        
        Task(title: "User Name's day Work"),
        Task(title: "iPhone 13 Great Design Change"),
        Task(title: "Nothing Much Workout !!!")
    ],  taskDate: getSampleDate(offset: 0)),
//    TaskMetaData(task:  [
//
//        Task(title: "Talk to Jenna Ezarik", memo: "Im")
//    ],  taskDate: getSampleDate(offset: -3)),
//    TaskMetaData(task:  [
//
//        Task(title: "Meeting with Tim Cook", memo: "Im")
//    ],  taskDate: getSampleDate(offset: -8)),
//    TaskMetaData(task:  [
//
//        Task(title: "Next Version of SwiftUI", memo: "Im")
//    ],  taskDate: getSampleDate(offset: 17)),
//    TaskMetaData(task:  [
//
//        Task(title: "iPhone 13 Great Design Change", memo: "Im")
//    ],  taskDate: getSampleDate(offset: 15)),
//    TaskMetaData(task:  [
//
//        Task(title: "App Updates....", memo: "Im")
//    ],  taskDate: getSampleDate(offset: 20)),
    
]
