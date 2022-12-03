//
//  FSC.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/01.
//

import SwiftUI
import UIKit
import FSCalendar

struct myCView : View {
    var body: some View{
        CalendarView()
    }
}



struct CalendarView : UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        

        var calendar: FSCalendar!

            calendar = FSCalendar(frame: CGRect(x: 0.0, y: 40.0, width: .infinity, height: 300))
            calendar.scrollDirection = .vertical
       
        
        return calendar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
