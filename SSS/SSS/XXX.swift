//
//  File.swift
//  SSS
//
//  Created by 서재혁 on 2022/11/28.
//
//
//import Foundation
//import SwiftUI
//import UIKit
//import JTAppleCalendar
//
//
//
//class CalendarView : UIViewController,JTACYearViewDelegate,JTACYearViewDataSource{
//    fileprivate var jtappleCalendar : JTACMonthView
//}



//class DateCell: JTACDayCell {
//    @IBOutlet var dateLabel: UILabel!
//}
//
//class ViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}
//
//extension ViewController: JTACMonthViewDataSource {
//    func configureCalendar(_ calendar: JTAppleCalendar.JTACMonthView) -> JTAppleCalendar.ConfigurationParameters {
//        <#code#>
//    }
//
//    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy MM dd"
//        let startDate = formatter.date(from: "2018 01 01")!
//        let endDate = Date()
//        return ConfigurationParameters(startDate: startDate, endDate: endDate)
//    }
//}
//
//extension ViewController: JTACMonthViewDelegate {
//    func calendar(_ calendar: JTAppleCalendar.JTACMonthView, cellForItemAt date: Date, cellState: JTAppleCalendar.CellState, indexPath: IndexPath) -> JTAppleCalendar.JTACDayCell {
//        <#code#>
//    }
//
//    func calendar(_ calendar: JTAppleCalendar.JTACMonthView, willDisplay cell: JTAppleCalendar.JTACDayCell, forItemAt date: Date, cellState: JTAppleCalendar.CellState, indexPath: IndexPath) {
//        <#code#>
//    }
//
//    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
//        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
//        cell.dateLabel.text = cellState.text
//        return cell
//    }
//    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
//        let cell = cell as! DateCell
//        cell.dateLabel.text = cellState.text
//    }
//}
//
//
//
